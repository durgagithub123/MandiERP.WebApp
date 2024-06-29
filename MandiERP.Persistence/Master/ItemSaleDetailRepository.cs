using MandiERP.Abstractions.Repository;
using MandiERP.Core.Abstraction;
using MandiERP.DataLayer;
using Microsoft.EntityFrameworkCore;

namespace MandiERP.Persistence
{
    public class ItemSaleDetailRepository : IItemSaleDetailRepository
    {
        private readonly MandiERPDbContext _context;

        public ItemSaleDetailRepository(MandiERPDbContext context)
        {
            _context = context;
        }

        public async Task<ItemSaleDetails> GetItemSaleDetailAsync(long id)
        {
            return await _context.ItemSaleDetails.FindAsync(id);
        }
        public async Task<IEnumerable<ItemSaleDetails>> GetAllItemSaleDetailsAsync()
        {
            return await _context.ItemSaleDetails.ToListAsync();
        }
        public async Task<ItemSaleDetails> CreateItemSaleDetailAsync(ItemSaleDetails itemSaleDetails)
        {
            _context.ItemSaleDetails.Add(itemSaleDetails);
            await _context.SaveChangesAsync();
            return itemSaleDetails;
        }
        public async Task<ItemSaleDetails> UpdateItemSaleDetailAsync(ItemSaleDetails itemSaleDetails)
        {
            _context.Entry(itemSaleDetails).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return itemSaleDetails;
        }
        public async Task<bool> DeleteItemSaleDetailAsync(ItemSaleDetails itemSaleDetails)
        {
            _context.ItemSaleDetails.Remove(itemSaleDetails);
            await _context.SaveChangesAsync();
            return true;
        }      
    }
}
