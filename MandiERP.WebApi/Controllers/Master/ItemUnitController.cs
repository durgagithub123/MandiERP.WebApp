using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service.Master.ItemUnit;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemUnitController : ControllerBase
    {
        private readonly IItemUnitService _service;
        private readonly ILogger<ItemUnitController> _logger;

        public ItemUnitController(IItemUnitService service, ILogger<ItemUnitController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<ItemUnitsDto>>> GetAllItemUnits()
        {
            try
            {
                var itemUnits = await _service.GetAllItemUnitsAsync();
                return Ok(itemUnits);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching item units.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ItemUnitsDto>> GetItemUnitById(int id)
        {
            try
            {
                var itemUnit = await _service.GetItemUnitAsync(id);
                if (itemUnit == null)
                {
                    return NotFound();
                }
                return Ok(itemUnit);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching item unit with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPost]
        public async Task<ActionResult<ItemUnitsDto>> AddItemUnit(ItemUnitsDto itemUnitDto)
        {
            try
            {
                var createdItemUnit = await _service.CreateItemUnitAsync(itemUnitDto);
                return CreatedAtAction(nameof(GetItemUnitById), new { id = createdItemUnit.Id }, createdItemUnit);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding item unit.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<ItemUnitsDto>> UpdateItemUnit(int id, ItemUnitsDto itemUnitDto)
        {
            try
            {
                var updatedItemUnit = await _service.UpdateItemUnitAsync(id, itemUnitDto);
                return Ok(updatedItemUnit);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating item unit with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItemUnit(int id)
        {
            try
            {
                await _service.DeleteItemUnitAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting item unit with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
