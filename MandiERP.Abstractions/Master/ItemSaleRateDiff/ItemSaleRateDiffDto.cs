using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Master
{
    public class ItemSaleRateDiffDto
    {
        public long Id { get; set; }

        public long? ItemSaleRateDiffNo { get; set; }

        public string? ItemSaleRateDiffCode { get; set; }

        public string? ItemSaleRateDiffDetail { get; set; }

        public long? FkAccountId { get; set; }

        public long? FkItemSaleDetailId { get; set; }

        public string? IsCompanyAccount { get; set; }

        public long FkBillDetailId { get; set; }

        public decimal? Quantity { get; set; }

        public decimal? Rate { get; set; }

        public string? SaleTypeFixOrWeightBased { get; set; }

        public decimal? GrossWeight { get; set; }

        public string? WeightDetails { get; set; }

        public decimal? NetWeight { get; set; }

        public decimal? CommissionPercent { get; set; }

        public decimal? CommissionAmount { get; set; }

        public decimal? TotalAmount { get; set; }

        public decimal? NetAmount { get; set; }

        public decimal? Squantity { get; set; }

        public decimal? Srate { get; set; }

        public string? SsaleTypeFixOrWeightBased { get; set; }

        public decimal? SgrossWeight { get; set; }

        public string? SweightDetails { get; set; }

        public decimal? SnetWeight { get; set; }

        public decimal? ScommissionPercent { get; set; }

        public decimal? ScommissionAmount { get; set; }

        public decimal? StotalAmount { get; set; }

        public decimal? SnetAmount { get; set; }

        public int? FkBranchId { get; set; }

        public string? IsActive { get; set; }

        public int? CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? ModifyBy { get; set; }

        public DateTime? ModifyDate { get; set; }

        public long? FkBillId { get; set; }

        public DateTime? Sysdate { get; set; }

        public virtual Account? FkAccount { get; set; }

        public virtual ItemSaleDetails? FkItemSaleDetail { get; set; }
    }
}
