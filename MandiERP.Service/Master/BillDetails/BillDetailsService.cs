using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{
    public class BillDetailsService : IBillDetailsService
    {
        private readonly IMapper _mapper;
        private readonly IBillDetailsRepository _repository;
        private readonly ILogger<BillDetailsService> _logger;

        public BillDetailsService(IMapper mapper, IBillDetailsRepository repository, ILogger<BillDetailsService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<BillDetailsDto> GetBillDetailAsync(long id)
        {
            try
            {
                var billDetail = await _repository.GetBillDetailAsync(id);
                return _mapper.Map<BillDetailsDto>(billDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting BillDetaill with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<IEnumerable<BillDetailsDto>> GetAllBillDetailsAsync()
        {
            try
            {
                var billDetails = await _repository.GetAllBillDetailsAsync();
                return _mapper.Map<IEnumerable<BillDetailsDto>>(billDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all BillDetails");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<BillDetailsDto> CreateBillDetailsAsync(BillDetailsDto billDetailsDto)
        {
            try
            {
                var billDetail = _mapper.Map<BillDetails>(billDetailsDto);
                var createdBillDetail = await _repository.CreateBillDetailsAsync(billDetail);
                return _mapper.Map<BillDetailsDto>(createdBillDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating BillDetail");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<BillDetailsDto> UpdateBillDetailsAsync(long id, BillDetailsDto billDetailsDto)
        {
            try
            {
                var existingBillDetail = await _repository.GetBillDetailAsync(id);
                if (existingBillDetail == null)
                {
                    _logger.LogWarning("BillDetail with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(billDetailsDto, existingBillDetail);
                var updatedBillDetail = await _repository.UpdateBillDetailsAsync(existingBillDetail);
                return _mapper.Map<BillDetailsDto>(updatedBillDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating BillDetail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<bool> DeleteBillDetailsAsync(long id)
        {
            try
            {
                var existingBillDetail = await _repository.GetBillDetailAsync(id);
                if (existingBillDetail == null)
                {
                    _logger.LogWarning("BillDetail with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteBillDetailsAsync(existingBillDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting BillDetails with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

    }
}
