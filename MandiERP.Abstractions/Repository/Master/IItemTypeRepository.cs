using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IItemTypeRepository
    {
        Task<ItemType> GetItemAsync(int id);
        Task<IEnumerable<ItemType>> GetAllItemsAsync();
        Task<ItemType> CreateItemAsync(ItemType itemType);
        Task<ItemType> UpdateItemAsync(ItemType itemType);
        Task<bool> DeleteItemAsync(ItemType itemType);

    }
}
