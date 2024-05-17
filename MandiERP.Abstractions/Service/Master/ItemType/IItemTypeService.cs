using MandiERP.Abstractions.Master;

namespace MandiERP.Abstractions.Service
{
    public interface IItemTypeService
    {
        Task<ItemTypeDto> GetItemTypeAsync(int id);
        Task<IEnumerable<ItemTypeDto>> GetAllItemTypesAsync();
        Task<ItemTypeDto> CreateItemTypeAsync(ItemTypeDto itemTypeDto);
        Task<ItemTypeDto> UpdateItemTypeAsync(int id, ItemTypeDto itemTypeDto);
        Task<bool> DeleteItemTypeAsync(int id);
    }
}
