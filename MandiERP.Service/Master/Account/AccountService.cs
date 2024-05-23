using AutoMapper;
using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Repository;
using MandiERP.Abstractions.Service;
using MandiERP.Core.Abstraction;
using Microsoft.Extensions.Logging;

namespace MandiERP.Service
{
    public class AccountService : IAccountService
    {
        private readonly IMapper _mapper;
        private readonly IAccountRepository _repository;
        private readonly ILogger<AccountService> _logger;

        public AccountService(IMapper mapper, IAccountRepository repository, ILogger<AccountService> logger)
        {
            _mapper = mapper;
            _repository = repository;
            _logger = logger;
        }

        public async Task<AccountDto> GetAccountAsync(long id)
        {
            try
            {
                var account = await _repository.GetAccountAsync(id);
                return _mapper.Map<AccountDto>(account);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting account with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<IEnumerable<AccountDto>> GetAllAccountsAsync()
        {
            try
            {
                var accounts = await _repository.GetAllAccountsAsync();
                return _mapper.Map<IEnumerable<AccountDto>>(accounts);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all Accounts");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<AccountDto> CreateAccountAsync(AccountDto accountDto)
        {
            try
            {
                var account = _mapper.Map<Account>(accountDto);
                var createdAccount = await _repository.CreateAccountAsync(account);
                return _mapper.Map<AccountDto>(createdAccount);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating Account");
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<AccountDto> UpdateAccountAsync(long id,AccountDto accountDto)
        {
            try
            {
                var existingAccount = await _repository.GetAccountAsync(id);
                if (existingAccount == null)
                {
                    _logger.LogWarning("Account with id {Id} not found for updating", id);
                    return null;
                }

                _mapper.Map(accountDto, existingAccount);
                var updatedAccount = await _repository.UpdateAccountAsync(existingAccount);
                return _mapper.Map<AccountDto>(updatedAccount);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating Account with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }

        public async Task<bool> DeleteAccountAsync(long id)
        {
            try
            {
                var existingAccount = await _repository.GetAccountAsync(id);
                if (existingAccount == null)
                {
                    _logger.LogWarning("Account with id {Id} not found for deletion", id);
                    return false;
                }

                return await _repository.DeleteAccountAsync(existingAccount);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting Account with id {Id}", id);
                throw; // Rethrow the exception to the caller
            }
        }
    }
}
