using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IBillDetailsRepository
    {
        Task<BillDetails> GetBillDetailAsync(long id);
        Task<IEnumerable<BillDetails>> GetAllBillDetailsAsync();
        Task<BillDetails> CreateBillDetailsAsync(BillDetails billDetails);
        Task<BillDetails> UpdateBillDetailsAsync(BillDetails billDetails);
        Task<bool> DeleteBillDetailsAsync(BillDetails billDetails);
    }
}
