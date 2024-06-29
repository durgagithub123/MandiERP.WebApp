using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IItemSaleRateDiffService
    {
        Task<ItemSaleRateDiffDto> GetItemSaleRateDiffAsync(long id);
        Task<IEnumerable<ItemSaleRateDiffDto>> GetAllItemSaleRateDiffAsync();
        Task<ItemSaleRateDiffDto> CreateItemSaleRateDiffAsync(ItemSaleRateDiffDto itemSaleRateDiffDto);
        Task<ItemSaleRateDiffDto> UpdateItemSaleRateDiffAsync(long id, ItemSaleRateDiffDto itemSaleRateDiffDto);
        Task<bool> DeleteItemSaleRateDiffAsync(long id);
    }
}
