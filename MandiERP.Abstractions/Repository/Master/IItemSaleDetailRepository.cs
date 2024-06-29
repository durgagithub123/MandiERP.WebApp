using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IItemSaleDetailRepository
    {
        Task<ItemSaleDetails> GetItemSaleDetailAsync(long id);
        Task<IEnumerable<ItemSaleDetails>> GetAllItemSaleDetailsAsync();
        Task<ItemSaleDetails> CreateItemSaleDetailAsync(ItemSaleDetails itemSaleDetails);
        Task<ItemSaleDetails> UpdateItemSaleDetailAsync(ItemSaleDetails itemSaleDetails);
        Task<bool> DeleteItemSaleDetailAsync(ItemSaleDetails itemSaleDetails);
    }
}
