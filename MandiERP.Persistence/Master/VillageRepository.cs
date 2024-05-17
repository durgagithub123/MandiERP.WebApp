using MandiERP.Abstractions.Repository;
using MandiERP.Core.Abstraction;
using MandiERP.DataLayer;
using Microsoft.EntityFrameworkCore;

namespace MandiERP.Persistence
{
    public class VillageRepository : IVillageRepository
    {
        private readonly MandiERPDbContext _context;

        public VillageRepository(MandiERPDbContext context)
        {
            _context = context;
        }

        public async Task<Village> GetVillageAsync(int id)
        {
            return await _context.Villages.FindAsync(id);
        }

        public async Task<IEnumerable<Village>> GetAllVillageAsync()
        {
            return await _context.Villages.ToListAsync();
        }

        public async Task<Village> CreateVillageAsync(Village village)
        {
            _context.Villages.Add(village);
            await _context.SaveChangesAsync();
            return village;
        }

        public async Task<Village> UpdateVillageAsync(Village village)
        {
            _context.Entry(village).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return village;
        }

        public async Task<bool> DeleteVillageAsync(Village village)
        {
            _context.Villages.Remove(village);
            await _context.SaveChangesAsync();
            return true;
        }
       
    }
}
