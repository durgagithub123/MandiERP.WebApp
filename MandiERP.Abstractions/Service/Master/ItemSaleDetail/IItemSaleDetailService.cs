using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IItemSaleDetailService
    {
        Task<ItemSaleDetailsDto> GetItemSaleDetailAsync(long id);
        Task<IEnumerable<ItemSaleDetailsDto>> GetAllItemSaleDetailsAsync();
        Task<ItemSaleDetailsDto> CreateItemSaleDetailAsync(ItemSaleDetailsDto itemSaleDetailsDto);
        Task<ItemSaleDetailsDto> UpdateItemSaleDetailAsync(long id, ItemSaleDetailsDto itemSaleDetailsDto);
        Task<bool> DeleteItemSaleDetailAsync(long id);
    }
}
