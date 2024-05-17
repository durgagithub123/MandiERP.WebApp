using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MandiERP.Core.Abstraction
{
    public partial class Village
    {
        public int VillageID { get; set; }

        public int? VillageNo { get; set; }

        public string VillageName { get; set; } = null!;

        public string? VillageNameHindi { get; set; }

        public string? State { get; set; }

        public string? Zip { get; set; }

        public string? Address { get; set; }

        public int? FkBranchId { get; set; }

        public string? IsActive { get; set; }

        public int? CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? ModifyBy { get; set; }

        public DateTime? ModifyDate { get; set; }

        public DateTime? Sysdate { get; set; }
    }
}
