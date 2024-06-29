using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Master
{
    public class ItemWeightDetailsDto
    {
        public int Id { get; set; }

        public int? ItemWeightDetailNo { get; set; }

        public long FkBillDetailId { get; set; }

        public decimal? WeightinKgm { get; set; }

        public int? FkBranchId { get; set; }

        public string? IsActive { get; set; }

        public int? CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? ModifyBy { get; set; }

        public DateTime? ModifyDate { get; set; }

        public DateTime? Sysdate { get; set; }

        public virtual BillDetails FkBillDetail { get; set; } = null!;
    }
}
