using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemWeightDetailController : ControllerBase
    {
        private readonly IItemWeightDetailService _service;
        private readonly ILogger<ItemWeightDetailController> _logger;

        public ItemWeightDetailController(IItemWeightDetailService service, ILogger<ItemWeightDetailController> logger)
        {
            _service = service;
            _logger = logger;
        }
        [HttpGet]
        public async Task<ActionResult<List<ItemWeightDetailsDto>>> GetAllItemWeightDetail()
        {
            try
            {
                var itemWeightDetails = await _service.GetAllItemWeightDetailAsync();
                return Ok(itemWeightDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching Item Weight Details.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ItemWeightDetailsDto>> GetItemWeightDetailById(int id)
        {
            try
            {
                var itemWeightDetail = await _service.GetItemWeightDetailAsync(id);
                if (itemWeightDetail == null)
                {
                    return NotFound();
                }
                return Ok(itemWeightDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching Item Weight Detail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        
        [HttpPost]
        public async Task<ActionResult<ItemWeightDetailsDto>> AddItemWeightDetail(ItemWeightDetailsDto itemWeightDetailsDto)
        {
            try
            {
                var createdItemWeightDetail = await _service.CreateItemWeightDetailAsync(itemWeightDetailsDto);
                return CreatedAtAction(nameof(GetItemWeightDetailById), new { id = createdItemWeightDetail.Id }, createdItemWeightDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding Item Weight Detail.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult<ItemWeightDetailsDto>> UpdateItemWeightDetail(int id, ItemWeightDetailsDto itemWeightDetailsDto)
        {
            try
            {
                var updatedItemWeightDetail = await _service.UpdateItemWeightDetailAsync(id, itemWeightDetailsDto);
                return Ok(updatedItemWeightDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating Item Weight Detail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItemWeightDetail(int id)
        {
            try
            {
                await _service.DeleteItemWeightDetailAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting Item Weight Detail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
