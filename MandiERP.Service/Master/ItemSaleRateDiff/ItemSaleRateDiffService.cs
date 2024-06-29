using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MandiERP.Service
{
    public class ItemSaleRateDiffService : IItemSaleRateDiffService
    {
        private readonly IMapper _mapper;
        private readonly IItemSaleRateDiffRepository _repository;
        private readonly ILogger<ItemSaleRateDiffService> _logger;

        public ItemSaleRateDiffService(IMapper mapper, IItemSaleRateDiffRepository repository, ILogger<ItemSaleRateDiffService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<ItemSaleRateDiffDto> GetItemSaleRateDiffAsync(long id)
        {
            try
            {
                var itemSaleRateDiff = await _repository.GetItemSaleRateDiffAsync(id);
                return _mapper.Map<ItemSaleRateDiffDto>(itemSaleRateDiff);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting item sale rate diff with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<IEnumerable<ItemSaleRateDiffDto>> GetAllItemSaleRateDiffAsync()
        {
            try
            {
                var itemSaleRateDiff = await _repository.GetAllItemSaleRateDiffAsync();
                return _mapper.Map<IEnumerable<ItemSaleRateDiffDto>>(itemSaleRateDiff);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all item sale rate diff");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<ItemSaleRateDiffDto> CreateItemSaleRateDiffAsync(ItemSaleRateDiffDto itemSaleRateDiffDto)
        {
            try
            {
                var itemSaleRateDiff = _mapper.Map<ItemSaleRateDiff>(itemSaleRateDiffDto);
                var createditemSaleRateDiff = await _repository.CreateItemSaleRateDiffAsync(itemSaleRateDiff);
                return _mapper.Map<ItemSaleRateDiffDto>(createditemSaleRateDiff);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating item sale rate diff");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<ItemSaleRateDiffDto> UpdateItemSaleRateDiffAsync(long id, ItemSaleRateDiffDto itemSaleRateDiffDto)
        {
            try
            {
                var existingItemSaleRateDiff = await _repository.GetItemSaleRateDiffAsync(id);
                if (existingItemSaleRateDiff == null)
                {
                    _logger.LogWarning("Item Sale Rate Diff with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(itemSaleRateDiffDto, existingItemSaleRateDiff);
                var updatedItemSaleRateDiff = await _repository.UpdateItemSaleRateDiffAsync(existingItemSaleRateDiff);
                return _mapper.Map<ItemSaleRateDiffDto>(updatedItemSaleRateDiff);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating Item Sale Rate Diff with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<bool> DeleteItemSaleRateDiffAsync(long id)
        {
            try
            {
                var existingItemSaleRateDiff = await _repository.GetItemSaleRateDiffAsync(id);
                if (existingItemSaleRateDiff == null)
                {
                    _logger.LogWarning("Item Sale Rate Diff with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteItemSaleRateDiffAsync(existingItemSaleRateDiff);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting Item Sale Rate Diff with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}
