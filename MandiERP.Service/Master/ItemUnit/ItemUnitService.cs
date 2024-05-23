using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service.Master.ItemUnit;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{
    internal class ItemUnitService : IItemUnitService
    {
        private readonly IMapper _mapper;
        private readonly IItemUnitRepository _repository;
        private readonly ILogger<ItemUnitService> _logger;

        public ItemUnitService(IMapper mapper, IItemUnitRepository repository, ILogger<ItemUnitService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<ItemUnitsDto> GetItemUnitAsync(int id)
        {
            try
            {
                var itemUnit = await _repository.GetItemUnitAsync(id);
                return _mapper.Map<ItemUnitsDto>(itemUnit);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting Item Unit with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<IEnumerable<ItemUnitsDto>> GetAllItemUnitsAsync()
        {
            try
            {
                var itemUnits = await _repository.GetAllItemUnitsAsync();
                return _mapper.Map<IEnumerable<ItemUnitsDto>>(itemUnits);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all Item Units");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<ItemUnitsDto> CreateItemUnitAsync(ItemUnitsDto itemUnitDto)
        {
            try
            {
                var itemUnit = _mapper.Map<ItemUnits>(itemUnitDto);
                var createdItemUnit = await _repository.CreateItemUnitAsync(itemUnit);
                return _mapper.Map<ItemUnitsDto>(createdItemUnit);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating Item Unit");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<ItemUnitsDto> UpdateItemUnitAsync(int id, ItemUnitsDto itemUnitDto)
        {
            try
            {
                var existingItemUnit = await _repository.GetItemUnitAsync(id);
                if (existingItemUnit == null)
                {
                    _logger.LogWarning("Item Unit with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(itemUnitDto, existingItemUnit);
                var updatedItemUnit = await _repository.UpdateItemUnitAsync(existingItemUnit);
                return _mapper.Map<ItemUnitsDto>(updatedItemUnit);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating Item Unit with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<bool> DeleteItemUnitAsync(int id)
        {
            try
            {
                var existingItemUnit = await _repository.GetItemUnitAsync(id);
                if (existingItemUnit == null)
                {
                    _logger.LogWarning("Item Unit with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteItemUnitAsync(existingItemUnit);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting Item Unit with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}
