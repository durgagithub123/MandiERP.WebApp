using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemSaleDetailController : ControllerBase
    {
        private readonly IItemSaleDetailService _service;
        private readonly ILogger<ItemSaleDetailController> _logger;

        public ItemSaleDetailController(IItemSaleDetailService service, ILogger<ItemSaleDetailController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<ItemSaleDetailsDto>>> GetAllItemSaleDetails()
        {
            try
            {
                var itemSaleDetails = await _service.GetAllItemSaleDetailsAsync();
                return Ok(itemSaleDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching itemSaleDetails.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<ItemSaleDetailsDto>> GetItemSaleDetailById(int id)
        {
            try
            {
                var itemSaleDetail = await _service.GetItemSaleDetailAsync(id);
                if (itemSaleDetail == null)
                {
                    return NotFound();
                }
                return Ok(itemSaleDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching itemSaleDetail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPost]
        public async Task<ActionResult<ItemSaleDetailsDto>> AddItemSaleDetail(ItemSaleDetailsDto itemSaleDetailsDto)
        {
            try
            {
                var createdItemSaleDetail = await _service.CreateItemSaleDetailAsync(itemSaleDetailsDto);
                return CreatedAtAction(nameof(GetItemSaleDetailById), new { id = createdItemSaleDetail.Id }, createdItemSaleDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding itemSaleDetail.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult<AccountDto>> UpdateItemSaleDetail(int id, ItemSaleDetailsDto itemSaleDetailsDto)
        {
            try
            {
                var updatedItemSaleDetails = await _service.UpdateItemSaleDetailAsync(id, itemSaleDetailsDto);
                return Ok(updatedItemSaleDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating itemSaleDetails with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItemSaleDetail(int id)
        {
            try
            {
                await _service.DeleteItemSaleDetailAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting itemSaleDetails with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
