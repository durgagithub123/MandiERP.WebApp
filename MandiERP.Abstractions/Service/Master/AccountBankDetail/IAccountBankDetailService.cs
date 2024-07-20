using MandiERP.Abstractions.Master;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MandiERP.Abstractions.Service
{
    public interface IAccountBankDetailService
    {
        Task<AccountBankDetailDto> GetAccountBankDetailAsync(long id);
        Task<IEnumerable<AccountBankDetailDto>> GetAllAccountsBankDetailAsync();
        Task<AccountBankDetailDto> CreateAccountBankDetailAsync(AccountBankDetailDto accountBankDetailDto);
        Task<AccountBankDetailDto> UpdateAccountBankDetailAsync(long id, AccountBankDetailDto accountBankDetailDto);
        Task<bool> DeleteAccountBankDetailAsync(long id);
    }
}
