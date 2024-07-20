using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IGadiMasterService
    {
        Task<GadiMasterDto> GetGadiMasterAsync(int id);
        Task<IEnumerable<GadiMasterDto>> GetAllGadiMastersAsync();
        Task<GadiMasterDto> CreateGadiMasterAsync(GadiMasterDto gadiMasterDto);
        Task<GadiMasterDto> UpdateGadiMasterAsync(int id, GadiMasterDto gadiMasterDto);
        Task<bool> DeleteGadiMasterAsync(int id);
    }
}
