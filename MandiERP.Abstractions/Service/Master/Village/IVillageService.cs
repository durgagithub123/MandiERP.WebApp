using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IVillageService
    {
        Task<VillageDto> GetVillageAsync(int id);
        Task<IEnumerable<VillageDto>> GetAllVillageAsync();
        Task<VillageDto> CreateVillageAsync(VillageDto villageDto);
        Task<VillageDto> UpdateVillageAsync(int id, VillageDto villageDto);
        Task<bool> DeleteVillageAsync(int id);

    }
}