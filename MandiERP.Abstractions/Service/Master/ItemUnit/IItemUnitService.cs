using MandiERP.Abstractions.Master;
using MandiERP.Core.Abstraction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MandiERP.Abstractions.Service.Master.ItemUnit
{
    public interface IItemUnitService
    {
        Task<ItemUnitsDto> GetItemUnitAsync(int id);
        Task<IEnumerable<ItemUnitsDto>> GetAllItemUnitsAsync();
        Task<ItemUnitsDto> CreateItemUnitAsync(ItemUnitsDto itemUnitDto);
        Task<ItemUnitsDto> UpdateItemUnitAsync(int id,ItemUnitsDto itemUnitDto);
        Task<bool> DeleteItemUnitAsync(int id);
    }
}
