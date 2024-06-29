using MandiERP.Core.Abstraction;

namespace MandiERP.Abstractions.Master
{
    public class AccountTypesDto
    {
        public int Id { get; set; }

        public int? AccountTypeNo { get; set; }

        public string? AccountCode { get; set; }

        public string? AccountTypeName { get; set; }

        public string? AccountType { get; set; }

        public string? AccountTypeDetail { get; set; }

        public string? Comment { get; set; }

        public string? SubHeadDetail { get; set; }

        public string? IsBalanceKhata { get; set; }

        public string? IsShowonPage { get; set; }

        public int? fkBranchID { get; set; }

        public string? IsActive { get; set; }

        public int? CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? ModifyBy { get; set; }

        public DateTime? ModifyDate { get; set; }

        public DateTime? Sysdate { get; set; }

        public virtual ICollection<Account> Accounts { get; set; } = new List<Account>();
    }
}
