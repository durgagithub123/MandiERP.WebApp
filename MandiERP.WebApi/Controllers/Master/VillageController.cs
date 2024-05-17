using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class VillageController : ControllerBase
    {
        private readonly IVillageService _service;
        private readonly ILogger<VillageController> _logger;


        public VillageController(IVillageService service, ILogger<VillageController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<VillageDto>>> GetAllVillages()
        {
            try
            {
                var villages = await _service.GetAllVillageAsync();
                return Ok(villages);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching item types.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<VillageDto>> GetVillageById(int id)
        {
            try
            {
                var village = await _service.GetVillageAsync(id);
                if (village == null)
                {
                    return NotFound();
                }
                return Ok(village);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching item type with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPost]
        public async Task<ActionResult<VillageDto>> AddVillage(VillageDto villageDto)
        {
            try
            {
                var createdVillage = await _service.CreateVillageAsync(villageDto);
                return CreatedAtAction(nameof(GetVillageById), new { id = createdVillage.Id }, createdVillage);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding item type.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<VillageDto>> UpdateVillage(int id, VillageDto villageDto)
        {
            try
            {
                var updatedVillage = await _service.UpdateVillageAsync(id, villageDto);
                return Ok(updatedVillage);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating item type with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }

    }
}
