using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class BillDetailsController : ControllerBase
    {
        private readonly IBillDetailsService _service;
        private readonly ILogger<BillDetailsController> _logger;

        public BillDetailsController(IBillDetailsService service, ILogger<BillDetailsController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<BillDetailsDto>>> GetAllBillDetails()
        {
            try
            {
                var billDetails = await _service.GetAllBillDetailsAsync();
                return Ok(billDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching billDetails.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<BillDetailsDto>> GetBillDetailsById(int id)
        {
            try
            {
                var billDetail = await _service.GetBillDetailAsync(id);
                if (billDetail == null)
                {
                    return NotFound();
                }
                return Ok(billDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching billDetail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPost]
        public async Task<ActionResult<BillDetailsDto>> AddBillDetail(BillDetailsDto billDetailsDto)
        {
            try
            {
                var createdBillDetail = await _service.CreateBillDetailsAsync(billDetailsDto);
                return CreatedAtAction(nameof(GetBillDetailsById), new { id = createdBillDetail.Id }, createdBillDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding BillDetail.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult<BillDetailsDto>> UpdateBillDetail(int id, BillDetailsDto billDetailsDto)
        {
            try
            {
                var updatedBillDetail = await _service.UpdateBillDetailsAsync(id, billDetailsDto);
                return Ok(updatedBillDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating billDetail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBillDetail(int id)
        {
            try
            {
                await _service.DeleteBillDetailsAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting billDetail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
