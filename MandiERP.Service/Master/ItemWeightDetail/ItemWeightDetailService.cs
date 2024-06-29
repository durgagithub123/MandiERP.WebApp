using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{
    public class ItemWeightDetailService : IItemWeightDetailService
    {
        private readonly IMapper _mapper;
        private readonly IItemWeightDetailRepository _repository;
        private readonly ILogger<ItemWeightDetailService> _logger;

        public ItemWeightDetailService(IMapper mapper, IItemWeightDetailRepository repository, ILogger<ItemWeightDetailService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<ItemWeightDetailsDto> GetItemWeightDetailAsync(int id)
        {
            try
            {
                var itemWeightDetail = await _repository.GetItemWeightDetailAsync(id);
                return _mapper.Map<ItemWeightDetailsDto>(itemWeightDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting item Weight Detail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<IEnumerable<ItemWeightDetailsDto>> GetAllItemWeightDetailAsync()
        {
            try
            {
                var itemWeightDetails = await _repository.GetAllItemWeightDetailAsync();
                return _mapper.Map<IEnumerable<ItemWeightDetailsDto>>(itemWeightDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all Item Weight Details");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<ItemWeightDetailsDto> CreateItemWeightDetailAsync(ItemWeightDetailsDto itemWeightDetailsDto)
        {
            try
            {
                var itemWeightDetail = _mapper.Map<ItemWeightDetails>(itemWeightDetailsDto);
                var createditemWeightDetail = await _repository.CreateItemWeightDetailAsync(itemWeightDetail);
                return _mapper.Map<ItemWeightDetailsDto>(createditemWeightDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating Item Weight Details");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<ItemWeightDetailsDto> UpdateItemWeightDetailAsync(int id, ItemWeightDetailsDto itemWeightDetailsDto)
        {
            try
            {
                var existingItemWeightDetail = await _repository.GetItemWeightDetailAsync(id);
                if (existingItemWeightDetail == null)
                {
                    _logger.LogWarning("Item Weight Detail with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(itemWeightDetailsDto, existingItemWeightDetail);
                var updatedItemWeightDetail = await _repository.UpdateItemWeightDetailAsync(existingItemWeightDetail);
                return _mapper.Map<ItemWeightDetailsDto>(updatedItemWeightDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating Item Weight Detail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<bool> DeleteItemWeightDetailAsync(int id)
        {
            try
            {
                var existingItemWeightDetail = await _repository.GetItemWeightDetailAsync(id);
                if (existingItemWeightDetail == null)
                {
                    _logger.LogWarning("Item Weight Detail with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteItemWeightDetailAsync(existingItemWeightDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting Item Weight Detail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}
