using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{
    public class VillageService : IVillageService
    {
        private readonly IMapper _mapper;
        private readonly IVillageRepository _repository;
        private readonly ILogger<VillageService> _logger;

        public VillageService(IMapper mapper,IVillageRepository repository, ILogger<VillageService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<VillageDto> GetVillageAsync(int id)
        {
            try
            {
                var village = await _repository.GetVillageAsync(id);
                return _mapper.Map<VillageDto>(village);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting ItemType with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<IEnumerable<VillageDto>> GetAllVillageAsync()
        {
            try
            {
                var villages = await _repository.GetAllVillageAsync();
                return _mapper.Map<IEnumerable<VillageDto>>(villages);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all ItemTypes");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<VillageDto> CreateVillageAsync(VillageDto villageDto)
        {
            try
            {
                var village = _mapper.Map<Village>(villageDto);
                var createdVillage = await _repository.CreateVillageAsync(village);
                return _mapper.Map<VillageDto>(createdVillage);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating ItemType");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<VillageDto> UpdateVillageAsync(int id, VillageDto villageDto)
        {
            try
            {
                var existingVillage = await _repository.GetVillageAsync(id);
                if (existingVillage == null)
                {
                    _logger.LogWarning("ItemType with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(villageDto, existingVillage);
                var updatedVillage = await _repository.UpdateVillageAsync(existingVillage);
                return _mapper.Map<VillageDto>(updatedVillage);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating ItemType with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<bool> DeleteVillageAsync(int id)
        {
            try
            {
                var existingVillage = await _repository.GetVillageAsync(id);
                if (existingVillage == null)
                {
                    _logger.LogWarning("ItemType with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteVillageAsync(existingVillage);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting ItemType with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }       
    }
}
