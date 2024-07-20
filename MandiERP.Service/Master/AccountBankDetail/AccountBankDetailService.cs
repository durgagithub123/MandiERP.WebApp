using AutoMapper;
using MandiERP.Abstractions;
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
    public class AccountBankDetailService : IAccountBankDetailService
    {
        private readonly IMapper _mapper;
        private readonly IAccountBankDetailRepository _repository;
        private readonly ILogger<AccountBankDetailService> _logger;

        public AccountBankDetailService(IMapper mapper, IAccountBankDetailRepository repository, ILogger<AccountBankDetailService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<AccountBankDetailDto> GetAccountBankDetailAsync(long id)
        {
            try
            {
                var accountBankDetail = await _repository.GetAccountBankDetailAsync(id);
                return _mapper.Map<AccountBankDetailDto>(accountBankDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting accountBankDetail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<IEnumerable<AccountBankDetailDto>> GetAllAccountsBankDetailAsync()
        {
            try
            {
                var accountBankDetails = await _repository.GetAllAccountsBankDetailAsync();
                return _mapper.Map<IEnumerable<AccountBankDetailDto>>(accountBankDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all AccountBankDetails");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<AccountBankDetailDto> CreateAccountBankDetailAsync(AccountBankDetailDto accountBankDetailDto)
        {
            try
            {
                var accountBankDetail = _mapper.Map<AccountBankDetail>(accountBankDetailDto);
                var createdAccountBankdetail = await _repository.CreateAccountBankDetailAsync(accountBankDetail);
                return _mapper.Map<AccountBankDetailDto>(createdAccountBankdetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating AccountBankDetail");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<AccountBankDetailDto> UpdateAccountBankDetailAsync(long id, AccountBankDetailDto accountBankDetailDto)
        {
            try
            {
                var existingAccountBankDetail = await _repository.GetAccountBankDetailAsync(id);
                if (existingAccountBankDetail == null)
                {
                    _logger.LogWarning("AccountBankDetail with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(accountBankDetailDto, existingAccountBankDetail);
                var updatedAccountBankdetail = await _repository.UpdateAccountBankDetailAsync(existingAccountBankDetail);
                return _mapper.Map<AccountBankDetailDto>(updatedAccountBankdetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating AccountBankdetail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<bool> DeleteAccountBankDetailAsync(long id)
        {
            try
            {
                var existingAccountBankDetail = await _repository.GetAccountBankDetailAsync(id);
                if (existingAccountBankDetail == null)
                {
                    _logger.LogWarning("AccountBankdetail with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteAccountBankDetailAsync(existingAccountBankDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting AccountBankDetail with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}
