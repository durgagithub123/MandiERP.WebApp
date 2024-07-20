using MandiERP.Abstractions;
using MandiERP.Core.Abstraction;
using MandiERP.DataLayer;
using Microsoft.EntityFrameworkCore;

namespace MandiERP.Persistence
{
    public class GadiMasterRepository : IGadiMasterRepository
    {
        private readonly MandiERPDbContext _context;
        public GadiMasterRepository(MandiERPDbContext context) 
        {
            _context = context;
        }
        public async Task<GadiMaster> GetGadiMasterAsync(int id)
        {
            return await _context.GadiMasters.FindAsync(id);
        }
        public async Task<IEnumerable<GadiMaster>> GetAllGadiMastersAsync()
        {
            return await _context.GadiMasters.ToListAsync();
        }
        public async Task<GadiMaster> CreateGadiMasterAsync(GadiMaster gadiMaster)
        {
            _context.GadiMasters.Add(gadiMaster);
            await _context.SaveChangesAsync();
            return gadiMaster;
        }
        public async Task<GadiMaster> UpdateGadiMasterAsync(GadiMaster gadiMaster)
        {
            _context.Entry(gadiMaster).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return gadiMaster;
        }
        public async Task<bool> DeleteGadiMasterAsync(GadiMaster gadiMaster)
        {
            _context.GadiMasters.Remove(gadiMaster);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
