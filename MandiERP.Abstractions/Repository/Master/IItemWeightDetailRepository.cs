using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IItemWeightDetailRepository
    {
        Task<ItemWeightDetails> GetItemWeightDetailAsync(int id);
        Task<IEnumerable<ItemWeightDetails>> GetAllItemWeightDetailAsync();
        Task<ItemWeightDetails> CreateItemWeightDetailAsync(ItemWeightDetails itemWeightDetails);
        Task<ItemWeightDetails> UpdateItemWeightDetailAsync(ItemWeightDetails itemWeightDetails);
        Task<bool> DeleteItemWeightDetailAsync(ItemWeightDetails itemWeightDetails);
    }
}
