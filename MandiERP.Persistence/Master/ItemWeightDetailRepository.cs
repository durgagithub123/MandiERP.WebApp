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
    public class ItemWeightDetailRepository : IItemWeightDetailRepository
    {
        private readonly MandiERPDbContext _context;

        public ItemWeightDetailRepository(MandiERPDbContext context)
        {
            _context = context;
        }

        public async Task<ItemWeightDetails> GetItemWeightDetailAsync(int id)
        {
            return await _context.ItemWeightDetails.FindAsync(id);
        }

        public async Task<IEnumerable<ItemWeightDetails>> GetAllItemWeightDetailAsync()
        {
            return await _context.ItemWeightDetails.ToListAsync();
        }

        public async Task<ItemWeightDetails> CreateItemWeightDetailAsync(ItemWeightDetails itemWeightDetails)
        {
            _context.ItemWeightDetails.Add(itemWeightDetails);
            await _context.SaveChangesAsync();
            return itemWeightDetails;
        }

        public async Task<ItemWeightDetails> UpdateItemWeightDetailAsync(ItemWeightDetails itemWeightDetails)
        {
            _context.Entry(itemWeightDetails).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return itemWeightDetails;
        }

        public async Task<bool> DeleteItemWeightDetailAsync(ItemWeightDetails itemWeightDetails)
        {
            _context.ItemWeightDetails.Remove(itemWeightDetails);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
