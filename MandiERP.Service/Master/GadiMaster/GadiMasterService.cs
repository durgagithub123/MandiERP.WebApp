using AutoMapper;
using MandiERP.Abstractions;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{
    public class GadiMasterService : IGadiMasterService
    {
        private readonly IMapper _mapper;
        private readonly IGadiMasterRepository _repository;
        private readonly ILogger<GadiMasterService> _logger;

        public GadiMasterService(IMapper mapper, IGadiMasterRepository repository, ILogger<GadiMasterService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }
        public async Task<GadiMasterDto> GetGadiMasterAsync(int id)
        {
            try
            {
                var gadiMaster = await _repository.GetGadiMasterAsync(id);
                return _mapper.Map<GadiMasterDto>(gadiMaster);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting GadiMaster with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<IEnumerable<GadiMasterDto>> GetAllGadiMastersAsync()
        {
            try
            {
                var gadiMasters = await _repository.GetAllGadiMastersAsync();
                return _mapper.Map<IEnumerable<GadiMasterDto>>(gadiMasters);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all GadiMasters");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<GadiMasterDto> CreateGadiMasterAsync(GadiMasterDto gadiMasterDto)
        {
            try
            {
                var gadiMaster = _mapper.Map<GadiMaster>(gadiMasterDto);
                var createdGadiMaster = await _repository.CreateGadiMasterAsync(gadiMaster);
                return _mapper.Map<GadiMasterDto>(createdGadiMaster);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating GadiMaster");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<GadiMasterDto> UpdateGadiMasterAsync(int id, GadiMasterDto gadiMasterDto)
        {
            try
            {
                var existingGadiMaster = await _repository.GetGadiMasterAsync(id);
                if (existingGadiMaster == null)
                {
                    _logger.LogWarning("GadiMaster with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(gadiMasterDto, existingGadiMaster);
                var updatedGadiMaster = await _repository.UpdateGadiMasterAsync(existingGadiMaster);
                return _mapper.Map<GadiMasterDto>(updatedGadiMaster);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating GadiMaster with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<bool> DeleteGadiMasterAsync(int id)
        {
            try
            {
                var existingGadiMaster = await _repository.GetGadiMasterAsync(id);
                if (existingGadiMaster == null)
                {
                    _logger.LogWarning("GadiMaster with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteGadiMasterAsync(existingGadiMaster);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting GadiMaster with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}
