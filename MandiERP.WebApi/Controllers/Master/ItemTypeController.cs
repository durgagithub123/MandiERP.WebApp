using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemTypeController : ControllerBase
    {
        private readonly IItemTypeService _service;
        private readonly ILogger<ItemTypeController> _logger;

        public ItemTypeController(IItemTypeService service, ILogger<ItemTypeController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<ItemTypeDto>>> GetAllItemTypes()
        {
            try
            {
                var itemTypes = await _service.GetAllItemTypesAsync();
                return Ok(itemTypes);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching item types.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ItemTypeDto>> GetItemTypeById(int id)
        {
            try
            {
                var itemType = await _service.GetItemTypeAsync(id);
                if (itemType == null)
                {
                    return NotFound();
                }
                return Ok(itemType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching item type with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPost]
        public async Task<ActionResult<ItemTypeDto>> AddItemType(ItemTypeDto itemTypeDto)
        {
            try
            {
                var createdItemType = await _service.CreateItemTypeAsync(itemTypeDto);
                return CreatedAtAction(nameof(GetItemTypeById), new { id = createdItemType.Id }, createdItemType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding item type.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<ItemTypeDto>> UpdateItemType(int id, ItemTypeDto itemTypeDto)
        {
            try
            {
                var updatedItemType = await _service.UpdateItemTypeAsync(id, itemTypeDto);
                return Ok(updatedItemType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating item type with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItemType(int id)
        {
            try
            {
                await _service.DeleteItemTypeAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting item type with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
