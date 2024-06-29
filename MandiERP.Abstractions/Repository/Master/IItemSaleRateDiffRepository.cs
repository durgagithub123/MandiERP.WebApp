using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IItemSaleRateDiffRepository
    {
        Task<ItemSaleRateDiff> GetItemSaleRateDiffAsync(long id);
        Task<IEnumerable<ItemSaleRateDiff>> GetAllItemSaleRateDiffAsync();
        Task<ItemSaleRateDiff> CreateItemSaleRateDiffAsync(ItemSaleRateDiff itemSaleRateDiff);
        Task<ItemSaleRateDiff> UpdateItemSaleRateDiffAsync(ItemSaleRateDiff itemSaleRateDiff);
        Task<bool> DeleteItemSaleRateDiffAsync(ItemSaleRateDiff itemSaleRateDiff);
    }
}
