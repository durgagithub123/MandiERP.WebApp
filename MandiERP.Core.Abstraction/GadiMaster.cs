namespace MandiERP.Core.Abstraction;

public partial class GadiMaster
{
    public int GadiMasterID { get; set; }
    public int? GadiMasterNo { get; set; }
    public string? GadiNo { get; set; }
    public string? Address { get; set; }
    public string? City { get; set; }
    public string? State { get; set; }
    public string? Country { get; set; }
    public decimal? PinCode { get; set; }
    public string? MobileNo { get; set; }
    public string? PhoneNo { get; set; }
    public string? EmailID { get; set; }
    public decimal? FaxNo { get; set; }
    public int? fkBranchID { get; set; }
    public string? IsActive { get; set; }
    public int? CreateBy { get; set; }
    public DateTime? CreateDate { get; set; }
    public int? ModifyBy { get; set; }
    public DateTime? ModifyDate { get; set; }
    public DateTime? Sysdate { get; set; }
}
