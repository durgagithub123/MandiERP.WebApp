using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions
{
    public interface IGadiMasterRepository
    {
        Task<GadiMaster> GetGadiMasterAsync(int id);
        Task<IEnumerable<GadiMaster>> GetAllGadiMastersAsync();
        Task<GadiMaster> CreateGadiMasterAsync(GadiMaster gadiMaster);
        Task<GadiMaster> UpdateGadiMasterAsync(GadiMaster gadiMaster);
        Task<bool> DeleteGadiMasterAsync(GadiMaster gadiMaster);
    }
}
