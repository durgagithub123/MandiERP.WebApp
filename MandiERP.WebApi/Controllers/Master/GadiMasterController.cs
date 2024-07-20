using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class GadiMasterController : ControllerBase
    {
        private readonly IGadiMasterService _service;
        private readonly ILogger<GadiMasterController> _logger;

        public GadiMasterController(IGadiMasterService service, ILogger<GadiMasterController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<GadiMasterDto>>> GetAllGadiMasters()
        {
            try
            {
                var gadiMasters = await _service.GetAllGadiMastersAsync();
                return Ok(gadiMasters);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching GadiMasters.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<GadiMasterDto>> GetGadiMasterById(int id)
        {
            try
            {
                var gadiMaster = await _service.GetGadiMasterAsync(id);
                if (gadiMaster == null)
                {
                    return NotFound();
                }
                return Ok(gadiMaster);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching GadiMaster with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPost]
        public async Task<ActionResult<GadiMasterDto>> AddGadiMaster(GadiMasterDto gadiMasterDto)
        {
            try
            {
                var createdGadiMaster = await _service.CreateGadiMasterAsync(gadiMasterDto);
                return CreatedAtAction(nameof(GetGadiMasterById), new { id = createdGadiMaster.Id }, createdGadiMaster);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding GadiMaster.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult<GadiMasterDto>> UpdateGadiMaster(int id, GadiMasterDto gadiMasterDto)
        {
            try
            {
                var updatedGadiMaster = await _service.UpdateGadiMasterAsync(id, gadiMasterDto);
                return Ok(updatedGadiMaster);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating GadiMaster with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteGadiMaster(int id)
        {
            try
            {
                await _service.DeleteGadiMasterAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting GadiMaster with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
