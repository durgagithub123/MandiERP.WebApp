using MandiERP.Abstractions.Repository;
using MandiERP.Core.Abstraction;
using MandiERP.DataLayer;
using Microsoft.EntityFrameworkCore;

namespace MandiERP.Persistence
{
    public class ItemUnitRepository : IItemUnitRepository
    {
        private readonly MandiERPDbContext _context;

        public ItemUnitRepository(MandiERPDbContext context)
        {
            _context = context;
        }

        public async Task<ItemUnits> GetItemUnitAsync(int id)
        {
            return await _context.ItemUnits.FindAsync(id);
        }
        public async Task<IEnumerable<ItemUnits>> GetAllItemUnitsAsync()
        {
            return await _context.ItemUnits.ToListAsync();
        }
        public async Task<ItemUnits> CreateItemUnitAsync(ItemUnits itemUnit)
        {
            _context.ItemUnits.Add(itemUnit);
            await _context.SaveChangesAsync();
            return itemUnit;
        }
        public async Task<ItemUnits> UpdateItemUnitAsync(ItemUnits itemUnit)
        {
            _context.Entry(itemUnit).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return itemUnit;
        }
        public async Task<bool> DeleteItemUnitAsync(ItemUnits itemUnit)
        {
            _context.ItemUnits.Remove(itemUnit);
            await _context.SaveChangesAsync();
            return true;
        }
        
    }
}
