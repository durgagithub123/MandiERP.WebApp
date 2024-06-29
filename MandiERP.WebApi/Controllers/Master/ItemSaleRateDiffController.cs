using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemSaleRateDiffController : ControllerBase
    {
        private readonly IItemSaleRateDiffService _service;
        private readonly ILogger<ItemSaleRateDiffController> _logger;

        public ItemSaleRateDiffController(IItemSaleRateDiffService service, ILogger<ItemSaleRateDiffController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<ItemSaleRateDiffDto>>> GetAllItemSaleRateDiff()
        {
            try
            {
                var itemSaleRateDiffs = await _service.GetAllItemSaleRateDiffAsync();
                return Ok(itemSaleRateDiffs);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching Item Sale Rate Diff.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<ItemSaleRateDiffDto>> GetItemSaleRateDiffById(int id)
        {
            try
            {
                var itemSaleRateDiff = await _service.GetItemSaleRateDiffAsync(id);
                if (itemSaleRateDiff == null)
                {
                    return NotFound();
                }
                return Ok(itemSaleRateDiff);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching Item Sale Rate Diff with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPost]
        public async Task<ActionResult<ItemSaleRateDiffDto>> AddItemSaleRateDiff(ItemSaleRateDiffDto itemSaleRateDiffDto)
        {
            try
            {
                var createditemSaleRateDiff = await _service.CreateItemSaleRateDiffAsync(itemSaleRateDiffDto);
                return CreatedAtAction(nameof(GetItemSaleRateDiffById), new { id = createditemSaleRateDiff.Id }, createditemSaleRateDiff);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding item Sale Rate Diff.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult<ItemSaleRateDiffDto>> UpdateItemSaleRateDiff(int id, ItemSaleRateDiffDto itemSaleRateDiffDto)
        {
            try
            {
                var updatedItemSaleRateDiff = await _service.UpdateItemSaleRateDiffAsync(id, itemSaleRateDiffDto);
                return Ok(updatedItemSaleRateDiff);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating Item Sale Rate Diff with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItemSaleRateDiff(int id)
        {
            try
            {
                await _service.DeleteItemSaleRateDiffAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting Item Sale Rate Diff with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
