using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IItemWeightDetailService
    {
        Task<ItemWeightDetailsDto> GetItemWeightDetailAsync(int id);
        Task<IEnumerable<ItemWeightDetailsDto>> GetAllItemWeightDetailAsync();
        Task<ItemWeightDetailsDto> CreateItemWeightDetailAsync(ItemWeightDetailsDto itemWeightDetailsDto);
        Task<ItemWeightDetailsDto> UpdateItemWeightDetailAsync(int id, ItemWeightDetailsDto itemWeightDetailsDto);
        Task<bool> DeleteItemWeightDetailAsync(int id);
    }
}
