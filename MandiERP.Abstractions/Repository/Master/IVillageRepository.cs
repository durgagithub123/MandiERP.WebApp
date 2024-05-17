using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IVillageRepository
    {
        Task<Village> GetVillageAsync(int id);
        Task<IEnumerable<Village>> GetAllVillageAsync();
        Task<Village> CreateVillageAsync(Village village);
        Task<Village> UpdateVillageAsync(Village village);
        Task<bool> DeleteVillageAsync(Village village);
    }
}
