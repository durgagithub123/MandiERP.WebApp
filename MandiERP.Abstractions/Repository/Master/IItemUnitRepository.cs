using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Repository
{
    public interface IItemUnitRepository
    {
        Task<ItemUnits> GetItemUnitAsync(int id);
        Task<IEnumerable<ItemUnits>> GetAllItemUnitsAsync();
        Task<ItemUnits> CreateItemUnitAsync(ItemUnits itemUnit);
        Task<ItemUnits> UpdateItemUnitAsync(ItemUnits itemUnit);
        Task<bool> DeleteItemUnitAsync(ItemUnits itemUnit);
    }
}

