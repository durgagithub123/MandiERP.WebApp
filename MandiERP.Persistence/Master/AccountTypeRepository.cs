using MandiERP.Abstractions.Repository;
using MandiERP.Core.Abstraction;
using MandiERP.DataLayer;
using Microsoft.EntityFrameworkCore;

namespace MandiERP.Persistence.Master
{
    public class AccountTypeRepository : IAccountTypeRepository
    {
        private readonly MandiERPDbContext _context;

        public AccountTypeRepository(MandiERPDbContext context)
        {
            _context = context;
        }

        public async Task<AccountTypes> GetAccountTypeAsync(int id)
        {
            return await _context.AccountTypes.FindAsync(id);
        }
        public async Task<IEnumerable<AccountTypes>> GetAllAccountTypeAsync()
        {
            return await _context.AccountTypes.ToListAsync();
        }
        public async Task<AccountTypes> CreateAccountTypeAsync(AccountTypes accountType)
        {
            _context.AccountTypes.Add(accountType);
            await _context.SaveChangesAsync();
            return accountType;
        }
        public async Task<AccountTypes> UpdateAccountTypeAsync(AccountTypes accountType)
        {
            _context.Entry(accountType).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return accountType;
        }
        public async Task<bool> DeleteAccountTypeAsync(AccountTypes accountType)
        {
            _context.AccountTypes.Remove(accountType);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
