using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IAccountService
    {
        Task<AccountDto> GetAccountAsync(long id);
        Task<IEnumerable<AccountDto>> GetAllAccountsAsync();
        Task<AccountDto> CreateAccountAsync(AccountDto accountDto);
        Task<AccountDto> UpdateAccountAsync(long id,AccountDto accountDto);
        Task<bool> DeleteAccountAsync(long id);
    }
}
