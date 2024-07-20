namespace MandiERP.Core.Abstraction;

public partial class AccountBankDetail
{
    public long AccountBankDetailID { get; set; }
    public long? AccountBankDetailNo { get; set; }
    public long? FkAccountId { get; set; }
    public string? BankAccountNo { get; set; }
    public string? BranchNo { get; set; }
    public string? BranchName { get; set; }
    public string? IfscCode { get; set; }
    public string? PanNo { get; set; }
    public string? AccountHolderName { get; set; }
    public string? Detail { get; set; }
    public string? Comments { get; set; }
    public string? IsShowonPage { get; set; }
    public int? FkBranchId { get; set; }
    public string? IsActive { get; set; }
    public DateTime? InsertDate { get; set; }
    public DateTime? ModifyDate { get; set; }
    public int? CreatedBy { get; set; }
    public int? ModifiedBy { get; set; }
    public DateTime? Sysdate { get; set; }
    public virtual Account? FkAccount { get; set; }
}
