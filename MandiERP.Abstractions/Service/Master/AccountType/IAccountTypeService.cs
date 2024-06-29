using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IAccountTypeService
    {
        Task<AccountTypesDto> GetAccountTypeAsync(int id);
        Task<IEnumerable<AccountTypesDto>> GetAllAccountTypeAsync();
        Task<AccountTypesDto> CreateAccountTypeAsync(AccountTypesDto accountTypeDto);
        Task<AccountTypesDto> UpdateAccountTypeAsync(int id, AccountTypesDto accountTypeDto);
        Task<bool> DeleteAccountTypeAsync(int id);
    }
}
