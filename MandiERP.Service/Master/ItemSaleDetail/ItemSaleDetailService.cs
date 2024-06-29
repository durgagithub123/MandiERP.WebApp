using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{
    public class ItemSaleDetailService : IItemSaleDetailService
    {
        private readonly IMapper _mapper;
        private readonly IItemSaleDetailRepository _repository;
        private readonly ILogger<ItemSaleDetailService> _logger;

        public ItemSaleDetailService(IMapper mapper, IItemSaleDetailRepository repository, ILogger<ItemSaleDetailService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<ItemSaleDetailsDto> GetItemSaleDetailAsync(long id)
        {
            try
            {
                var itemSaleDetail = await _repository.GetItemSaleDetailAsync(id);
                return _mapper.Map<ItemSaleDetailsDto>(itemSaleDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting item Sale Detail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<IEnumerable<ItemSaleDetailsDto>> GetAllItemSaleDetailsAsync()
        {
            try
            {
                var itemSaleDetails = await _repository.GetAllItemSaleDetailsAsync();
                return _mapper.Map<IEnumerable<ItemSaleDetailsDto>>(itemSaleDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all item Sale Details");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<ItemSaleDetailsDto> CreateItemSaleDetailAsync(ItemSaleDetailsDto itemSaleDetailsDto)
        {
            try
            {
                var itemSaleDetail = _mapper.Map<ItemSaleDetails>(itemSaleDetailsDto);
                var createdItemSaleDetail = await _repository.CreateItemSaleDetailAsync(itemSaleDetail);
                return _mapper.Map<ItemSaleDetailsDto>(itemSaleDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating item Sale Detail");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<ItemSaleDetailsDto> UpdateItemSaleDetailAsync(long id, ItemSaleDetailsDto itemSaleDetailsDto)
        {
            try
            {
                var existingItemSaleDetail = await _repository.GetItemSaleDetailAsync(id);
                if (existingItemSaleDetail == null)
                {
                    _logger.LogWarning("Account with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(itemSaleDetailsDto, existingItemSaleDetail);
                var updatedItemSaleDetail = await _repository.UpdateItemSaleDetailAsync(existingItemSaleDetail);
                return _mapper.Map<ItemSaleDetailsDto>(updatedItemSaleDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating item Sale Detail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<bool> DeleteItemSaleDetailAsync(long id)
        {
            try
            {
                var existingItemSaleDetail = await _repository.GetItemSaleDetailAsync(id);
                if (existingItemSaleDetail == null)
                {
                    _logger.LogWarning("Item Sale Detail with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteItemSaleDetailAsync(existingItemSaleDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting Item Sale Detail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}
