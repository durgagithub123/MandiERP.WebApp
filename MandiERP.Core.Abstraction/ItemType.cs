namespace MandiERP.Core.Abstraction;

public partial class ItemType
{
    public int ItemTypeId { get; set; }

    public int? ItemTypeNo { get; set; }

    public string? ItemName { get; set; }

    public string? ItemNameHindi { get; set; }

    public int? RateOfUnitinKgs { get; set; }

    public decimal? PercentComission { get; set; }

    public int? FkBranchId { get; set; }

    public string? IsActive { get; set; }

    public int? CreateBy { get; set; }

    public DateTime? CreateDate { get; set; }

    public int? ModifyBy { get; set; }

    public DateTime? ModifyDate { get; set; }

    public DateTime? Sysdate { get; set; }
}
