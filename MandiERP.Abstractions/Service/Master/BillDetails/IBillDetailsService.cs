using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IBillDetailsService
    {
        Task<BillDetailsDto> GetBillDetailAsync(long id);
        Task<IEnumerable<BillDetailsDto>> GetAllBillDetailsAsync();
        Task<BillDetailsDto> CreateBillDetailsAsync(BillDetailsDto billDetailsDto);
        Task<BillDetailsDto> UpdateBillDetailsAsync(long id, BillDetailsDto billDetailsDto);
        Task<bool> DeleteBillDetailsAsync(long id);
    }
}
