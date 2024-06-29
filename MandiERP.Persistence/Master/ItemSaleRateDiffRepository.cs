using MandiERP.Abstractions.Repository;
using MandiERP.Core.Abstraction;
using MandiERP.DataLayer;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MandiERP.Persistence.Master
{
    public class ItemSaleRateDiffRepository : IItemSaleRateDiffRepository
    {
        private readonly MandiERPDbContext _context;

        public ItemSaleRateDiffRepository(MandiERPDbContext context)
        {
            _context = context;
        }

        public async Task<ItemSaleRateDiff> GetItemSaleRateDiffAsync(long id)
        {
            return await _context.ItemSaleRateDiffs.FindAsync(id);
        }

        public async Task<IEnumerable<ItemSaleRateDiff>> GetAllItemSaleRateDiffAsync()
        {
            return await _context.ItemSaleRateDiffs.ToListAsync();
        }

        public async Task<ItemSaleRateDiff> CreateItemSaleRateDiffAsync(ItemSaleRateDiff itemSaleRateDiff)
        {
            _context.ItemSaleRateDiffs.Add(itemSaleRateDiff);
            await _context.SaveChangesAsync();
            return itemSaleRateDiff;
        }

        public async Task<ItemSaleRateDiff> UpdateItemSaleRateDiffAsync(ItemSaleRateDiff itemSaleRateDiff)
        {
            _context.Entry(itemSaleRateDiff).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return itemSaleRateDiff;
        }

        public async Task<bool> DeleteItemSaleRateDiffAsync(ItemSaleRateDiff itemSaleRateDiff)
        {
            _context.ItemSaleRateDiffs.Remove(itemSaleRateDiff);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
