using MandiERP.Abstractions.Repository;
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
    public class BillDetailsRepository : IBillDetailsRepository
    {
        private readonly MandiERPDbContext _context;

        public BillDetailsRepository(MandiERPDbContext context) 
        {
            _context = context;
        }

        public async Task<BillDetails> GetBillDetailAsync(long id)
        {
            return await _context.BillDetails.FindAsync(id);
        }

        public async Task<IEnumerable<BillDetails>> GetAllBillDetailsAsync()
        {
            return await _context.BillDetails.ToListAsync();
        }

        public async Task<BillDetails> CreateBillDetailsAsync(BillDetails billDetails)
        {
            _context.BillDetails.Add(billDetails);
            await _context.SaveChangesAsync();
            return billDetails;
        }

        public async Task<BillDetails> UpdateBillDetailsAsync(BillDetails billDetails)
        {
            _context.Entry(billDetails).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return billDetails;
        }

        public async Task<bool> DeleteBillDetailsAsync(BillDetails billDetails)
        {
            _context.BillDetails.Remove(billDetails);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
