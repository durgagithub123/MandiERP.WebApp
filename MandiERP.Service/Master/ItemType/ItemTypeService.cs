using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{

    public class ItemTypeService : IItemTypeService
    {
        private readonly IMapper _mapper;
        private readonly IItemTypeRepository _repository;
        private readonly ILogger<ItemTypeService> _logger;

        public ItemTypeService(IItemTypeRepository repository, IMapper mapper, ILogger<ItemTypeService> logger)
        {
            _repository = repository;
            _mapper = mapper;
            _logger = logger;
        }

        public async Task<ItemTypeDto> GetItemTypeAsync(int id)
        {
            try
            {
                var itemType = await _repository.GetItemAsync(id);
                return _mapper.Map<ItemTypeDto>(itemType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting ItemType with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<IEnumerable<ItemTypeDto>> GetAllItemTypesAsync()
        {
            try
            {
                var itemTypes = await _repository.GetAllItemsAsync();
                return _mapper.Map<IEnumerable<ItemTypeDto>>(itemTypes);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all ItemTypes");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<ItemTypeDto> CreateItemTypeAsync(ItemTypeDto itemTypeDto)
        {
            try
            {
                var itemType = _mapper.Map<ItemType>(itemTypeDto);
                var createdItemType = await _repository.CreateItemAsync(itemType);
                return _mapper.Map<ItemTypeDto>(createdItemType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating ItemType");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<ItemTypeDto> UpdateItemTypeAsync(int id, ItemTypeDto itemTypeDto)
        {
            try
            {
                var existingItemType = await _repository.GetItemAsync(id);
                if (existingItemType == null)
                {
                    _logger.LogWarning("ItemType with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(itemTypeDto, existingItemType);
                var updatedItemType = await _repository.UpdateItemAsync(existingItemType);
                return _mapper.Map<ItemTypeDto>(updatedItemType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating ItemType with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<bool> DeleteItemTypeAsync(int id)
        {
            try
            {
                var existingItemType = await _repository.GetItemAsync(id);
                if (existingItemType == null)
                {
                    _logger.LogWarning("ItemType with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteItemAsync(existingItemType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting ItemType with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}