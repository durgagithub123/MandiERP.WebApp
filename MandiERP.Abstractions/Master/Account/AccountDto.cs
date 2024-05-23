namespace MandiERP.Abstractions.Master
{
    public class AccountDto
    {
        public long Id { get; set; }
        public long? AccountNo { get; set; }
        public string? AccountFirmName { get; set; }
        public string? AccountFirmNameHindi { get; set; }
        public string? AccountSortName { get; set; }
        public string? AccountHolderDetail { get; set; }
        public int? FkAccountTypeId { get; set; }
        public string? AccountCode { get; set; }
        public string? AccountFirmCode { get; set; }
        public long? FkVillageId { get; set; }
        public string? AccountName { get; set; }
        public string? AccountNameHindi { get; set; }
        public string? AccountMobileNo { get; set; }
        public string? AccountPhoneNo { get; set; }
        public string? AccountAddress1 { get; set; }
        public string? AccountAddress2 { get; set; }
        public string? AccountCity { get; set; }
        public string? AccountState { get; set; }
        public string? AccountZip { get; set; }
        public string? AccountPanNo { get; set; }
        public string? IsShowonPage { get; set; }
        public int? FkBranchId { get; set; }
        public string? IsActive { get; set; }
        public DateTime? InsertDate { get; set; }
        public DateTime? ModifyDate { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public string? LicenceNo { get; set; }
        public string? EmailId { get; set; }
        public DateTime? Sysdate { get; set; }
        public int? FkBankAccountId { get; set; }
        public int? FkAccountBankDetailId { get; set; }
        public string? Remark { get; set; }
    }
}
