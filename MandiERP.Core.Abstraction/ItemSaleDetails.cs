namespace MandiERP.Core.Abstraction;
    public partial class ItemSaleDetails
    {
        public long ItemSaleDetailID { get; set; }

        public long? ItemSaleDetailNo { get; set; }

        public string? ItemSaleCode { get; set; }

        public string? ItemSaleCodeDetail { get; set; }

        public long? FkAccountId { get; set; }

        public string? PhoneNo { get; set; }

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

        public int? FkBranchId { get; set; }

        public string? IsActive { get; set; }

        public int? CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? ModifyBy { get; set; }

        public DateTime? ModifyDate { get; set; }

        public long? FkBillId { get; set; }

        public string? Remark { get; set; }

        public string? Comment { get; set; }

        public DateTime? Sysdate { get; set; }

        public decimal? PaidAmount { get; set; }

        public decimal? Discount { get; set; }

        public decimal? RemainingAmount { get; set; }

        public bool? IsPanaPaid { get; set; }

        public virtual Account? FkAccount { get; set; }

        public virtual BillDetails FkBillDetail { get; set; } = null!;

        public virtual ICollection<ItemSaleRateDiff> ItemSaleRateDiffs { get; set; } = new List<ItemSaleRateDiff>();
}

