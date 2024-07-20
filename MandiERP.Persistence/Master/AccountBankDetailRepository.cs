using MandiERP.Abstractions;
using MandiERP.Core.Abstraction;
using MandiERP.DataLayer;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MandiERP.Persistence
{
    public class AccountBankDetailRepository : IAccountBankDetailRepository
    {
        private readonly MandiERPDbContext _context;

        public AccountBankDetailRepository(MandiERPDbContext context)
        {
            _context = context;
        }

        public async Task<AccountBankDetail> GetAccountBankDetailAsync(long id)
        {
            return await _context.AccountBankDetails.FindAsync(id);
        }
        public async Task<IEnumerable<AccountBankDetail>> GetAllAccountsBankDetailAsync()
        {
            return await _context.AccountBankDetails.ToListAsync();
        }
        public async Task<AccountBankDetail> CreateAccountBankDetailAsync(AccountBankDetail accountBankDetail)
        {
            _context.AccountBankDetails.Add(accountBankDetail);
            await _context.SaveChangesAsync();
            return accountBankDetail;
        }
        public async Task<AccountBankDetail> UpdateAccountBankDetailAsync(AccountBankDetail accountBankDetail)
        {
            _context.Entry(accountBankDetail).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return accountBankDetail;
        }
        public async Task<bool> DeleteAccountBankDetailAsync(AccountBankDetail accountBankDetail)
        {
            _context.AccountBankDetails.Remove(accountBankDetail);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
