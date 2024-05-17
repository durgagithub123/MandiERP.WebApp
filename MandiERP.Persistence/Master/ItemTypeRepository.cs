using MandiERP.Abstractions.Repository;
using MandiERP.Core.Abstraction;
using MandiERP.DataLayer;
using Microsoft.EntityFrameworkCore;

namespace MandiERP.Persistence
{
    public class ItemTypeRepository : IItemTypeRepository
    {
        private readonly MandiERPDbContext _context;

        public ItemTypeRepository(MandiERPDbContext context)
        {
            _context = context;
        }

        public async Task<ItemType> GetItemAsync(int id)
        {
            return await _context.ItemTypes.FindAsync(id);
        }

        public async Task<IEnumerable<ItemType>> GetAllItemsAsync()
        {
            return await _context.ItemTypes.ToListAsync();
        }

        public async Task<ItemType> CreateItemAsync(ItemType itemType)
        {
            _context.ItemTypes.Add(itemType);
            await _context.SaveChangesAsync();
            return itemType;
        }

        public async Task<ItemType> UpdateItemAsync(ItemType itemType)
        {
            _context.Entry(itemType).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return itemType;
        }

        public async Task<bool> DeleteItemAsync(ItemType itemType)
        {
            _context.ItemTypes.Remove(itemType);
            await _context.SaveChangesAsync();
            return true;
        }
    }

}
