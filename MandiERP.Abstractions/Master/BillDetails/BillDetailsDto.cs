using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Master
{
    public class BillDetailsDto
    {
        public long Id { get; set; }

        public long? BillDetailNo { get; set; }

        public string? BillDetailCode { get; set; }

        public long? fkBillID { get; set; }

        public int? SNo { get; set; }

        public int fkItemTypeID { get; set; }

        public string? ItemName { get; set; }

        public int fkItemUnitID { get; set; }

        public string? ItemUnit { get; set; }

        public string? ItemMarca { get; set; }

        public decimal? Quantity { get; set; }

        public decimal? ActualRate { get; set; }

        public decimal? BillRate { get; set; }

        public string? WeightDetails { get; set; }

        public string? BillWeightDetails { get; set; }

        public decimal? GrossWeight { get; set; }

        public decimal? BillGrossWeight { get; set; }

        public decimal? NetWeight { get; set; }

        public decimal? BillNetWeight { get; set; }

        public string? SaleTypeFixOrWeightBased { get; set; }

        public decimal? CommissionAmount { get; set; }

        public decimal? TotalWeightCutting { get; set; }

        public decimal? TotalHammali { get; set; }

        public decimal? TotalTulai { get; set; }

        public decimal? TotalKhadiKari { get; set; }

        public decimal? ActualTotalAmount { get; set; }

        public decimal? BillTotalAmount { get; set; }

        public int? fkBranchID { get; set; }

        public string? IsActive { get; set; }

        public int? CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? ModifyBy { get; set; }

        public DateTime? ModifyDate { get; set; }

        public decimal? CommissionPercent { get; set; }

        public DateTime? Sysdate { get; set; }

        public decimal? AvgWeight { get; set; }

        public decimal? CommissionPercentS { get; set; }

        public decimal? CommissionAmountS { get; set; }

        public decimal? AvgRate { get; set; }

        public decimal? PaidAmount { get; set; }

        public decimal? Discount { get; set; }

        public decimal? RemainingAmount { get; set; }

        public bool? IsPanaPaid { get; set; }

        // public virtual Bill? FkBill { get; set; }

        public virtual ICollection<ItemSaleDetails> ItemSaleDetails { get; set; } = new List<ItemSaleDetails>();

        public virtual ICollection<ItemWeightDetails> ItemWeightDetails { get; set; } = new List<ItemWeightDetails>();
    }
}
