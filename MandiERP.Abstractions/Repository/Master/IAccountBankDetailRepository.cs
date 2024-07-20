using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions
{
    public interface IAccountBankDetailRepository
    {
        Task<AccountBankDetail> GetAccountBankDetailAsync(long id);
        Task<IEnumerable<AccountBankDetail>> GetAllAccountsBankDetailAsync();
        Task<AccountBankDetail> CreateAccountBankDetailAsync(AccountBankDetail accountBankDetail);
        Task<AccountBankDetail> UpdateAccountBankDetailAsync(AccountBankDetail accountBankDetail);
        Task<bool> DeleteAccountBankDetailAsync(AccountBankDetail accountBankDetail);
    }
}
