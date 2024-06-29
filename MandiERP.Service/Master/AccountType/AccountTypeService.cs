using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{
    public class AccountTypeService : IAccountTypeService
    {
        private readonly IMapper _mapper;
        private readonly IAccountTypeRepository _repository;
        private readonly ILogger<AccountTypeService> _logger;

        public AccountTypeService(IMapper mapper, IAccountTypeRepository repository, ILogger<AccountTypeService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<AccountTypesDto> GetAccountTypeAsync(int id)
        {
            try
            {
                var accountType = await _repository.GetAccountTypeAsync(id);
                return _mapper.Map<AccountTypesDto>(accountType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting account Type with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<IEnumerable<AccountTypesDto>> GetAllAccountTypeAsync()
        {
            try
            {
                var accountTypes = await _repository.GetAllAccountTypeAsync();
                return _mapper.Map<IEnumerable<AccountTypesDto>>(accountTypes);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all Account Types");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<AccountTypesDto> CreateAccountTypeAsync(AccountTypesDto accountTypeDto)
        {
            try
            {
                var accountType = _mapper.Map<AccountTypes>(accountTypeDto);
                var createdAccountType = await _repository.CreateAccountTypeAsync(accountType);
                return _mapper.Map<AccountTypesDto>(createdAccountType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating Account Type");
                throw; // Rethrow the exception to the caller
            }
        }
        public async Task<AccountTypesDto> UpdateAccountTypeAsync(int id, AccountTypesDto accountTypeDto)
        {
            try
            {
                var existingAccountType = await _repository.GetAccountTypeAsync(id);
                if (existingAccountType == null)
                {
                    _logger.LogWarning("Account Type with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(accountTypeDto, existingAccountType);
                var updatedAccountType = await _repository.UpdateAccountTypeAsync(existingAccountType);
                return _mapper.Map<AccountTypesDto>(updatedAccountType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating Account Type with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<bool> DeleteAccountTypeAsync(int id)
        {
            try
            {
                var existingAccountType = await _repository.GetAccountTypeAsync(id);
                if (existingAccountType == null)
                {
                    _logger.LogWarning("Account Type with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteAccountTypeAsync(existingAccountType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting Account Type with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}
