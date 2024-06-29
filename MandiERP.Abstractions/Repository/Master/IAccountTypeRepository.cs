using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IAccountTypeRepository
    {
        Task<AccountTypes> GetAccountTypeAsync(int id);
        Task<IEnumerable<AccountTypes>> GetAllAccountTypeAsync();
        Task<AccountTypes> CreateAccountTypeAsync(AccountTypes accountType);
        Task<AccountTypes> UpdateAccountTypeAsync(AccountTypes accountType);
        Task<bool> DeleteAccountTypeAsync(AccountTypes accountType);
    }
}
