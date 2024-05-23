using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IAccountRepository
    {
        Task<Account> GetAccountAsync(long id);
        Task<IEnumerable<Account>> GetAllAccountsAsync();     
        Task<Account> CreateAccountAsync(Account account);
        Task<Account> UpdateAccountAsync(Account account);
        Task<bool> DeleteAccountAsync(Account account);
    }
}
