using MandiERP.Core.Abstraction;
using Microsoft.EntityFrameworkCore;
namespace MandiERP.DataLayer
{
    public class MandiERPDbContext : DbContext
    {
        public MandiERPDbContext(DbContextOptions<MandiERPDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
        #region DbSet Adding in Controller
        public virtual DbSet<Village> Villages { get; set; }
        public virtual DbSet<ItemType> ItemTypes { get; set; }
        //public virtual DbSet<ItemUnit> ItemUnits { get; set; }
        //public virtual DbSet<Account> Accounts { get; set; }
        //public DbSet<MandiERP.Model.DB.Bill>? Bill { get; set; }
        #endregion

        #region DbSet Details

        //public virtual DbSet<AccountBankDetail> AccountBankDetails { get; set; }

        //public virtual DbSet<AccountTransaction> AccountTransactions { get; set; }

        //public virtual DbSet<AccountTransactionsHistory> AccountTransactionsHistories { get; set; }

        //public virtual DbSet<AccountType> AccountTypes { get; set; }

        //public virtual DbSet<Bill> Bills { get; set; }

        //public virtual DbSet<BillDetail> BillDetails { get; set; }

        //public virtual DbSet<BillExpense> BillExpenses { get; set; }

        //public virtual DbSet<BillPayment> BillPayments { get; set; }

        //public virtual DbSet<BillPaymentDetail> BillPaymentDetails { get; set; }

        //public virtual DbSet<BillType> BillTypes { get; set; }

        //public virtual DbSet<BranchMaster> BranchMasters { get; set; }

        //public virtual DbSet<CashBook> CashBooks { get; set; }

        //public virtual DbSet<Configuration> Configurations { get; set; }

        //public virtual DbSet<ExportExpense> ExportExpenses { get; set; }

        //public virtual DbSet<ExportItemDetail> ExportItemDetails { get; set; }

        //public virtual DbSet<ExportMaster> ExportMasters { get; set; }

        //public virtual DbSet<GadiDriverMaster> GadiDriverMasters { get; set; }

        //public virtual DbSet<GadiMaster> GadiMasters { get; set; }

        //public virtual DbSet<ItemSaleDetail> ItemSaleDetails { get; set; }

        //public virtual DbSet<ItemSaleDetailsHistory> ItemSaleDetailsHistories { get; set; }

        //public virtual DbSet<ItemSaleRateDiff> ItemSaleRateDiffs { get; set; }

        //public virtual DbSet<ItemSaleSummary> ItemSaleSummaries { get; set; }


        //public virtual DbSet<ItemWeightDetail> ItemWeightDetails { get; set; }

        //public virtual DbSet<ManageCarat> ManageCarats { get; set; }

        //public virtual DbSet<ManageHammali> ManageHammalis { get; set; }

        //public virtual DbSet<ManageStock> ManageStocks { get; set; }

        //public virtual DbSet<Role> Roles { get; set; }

        //public virtual DbSet<User> Users { get; set; }

        //public virtual DbSet<UserAccount> UserAccounts { get; set; }

        //public virtual DbSet<UserCm> UserCms { get; set; }

        //public virtual DbSet<UserConfig> UserConfigs { get; set; }

        //public virtual DbSet<UserDetail> UserDetails { get; set; }

        //public virtual DbSet<UserInRole> UserInRoles { get; set; }

        //public virtual DbSet<UserLogin> UserLogins { get; set; }

        //public virtual DbSet<UserLoginMaster> UserLoginMasters { get; set; }

        ////public virtual DbSet<Village> Villages { get; set; }

        //public virtual DbSet<VoucherType> VoucherTypes { get; set; }

        //public virtual DbSet<VwAccountFinal> VwAccountFinals { get; set; }

        //public virtual DbSet<VwAccountList> VwAccountLists { get; set; }

        //public virtual DbSet<VwAccountTransaction> VwAccountTransactions { get; set; }

        //public virtual DbSet<VwAccountType> VwAccountTypes { get; set; }

        //public virtual DbSet<VwAccountsBalance> VwAccountsBalances { get; set; }

        //public virtual DbSet<VwAccountsSaleAmount> VwAccountsSaleAmounts { get; set; }

        //public virtual DbSet<VwAuthentication> VwAuthentications { get; set; }

        //public virtual DbSet<VwBalanceSheet> VwBalanceSheets { get; set; }

        //public virtual DbSet<VwBalanceSheetDetail> VwBalanceSheetDetails { get; set; }

        //public virtual DbSet<VwBankAccountDetail> VwBankAccountDetails { get; set; }

        //public virtual DbSet<VwBill> VwBills { get; set; }

        //public virtual DbSet<VwBillCommission> VwBillCommissions { get; set; }

        //public virtual DbSet<VwBillDetail> VwBillDetails { get; set; }

        //public virtual DbSet<VwBillDetail0ld> VwBillDetail0lds { get; set; }

        //public virtual DbSet<VwBillDetailCw> VwBillDetailCws { get; set; }

        //public virtual DbSet<VwBillDetailExportBilti> VwBillDetailExportBiltis { get; set; }

        //public virtual DbSet<VwBillDetailExportBiltiOld> VwBillDetailExportBiltiOlds { get; set; }

        //public virtual DbSet<VwBillDetailIndb> VwBillDetailIndbs { get; set; }

        //public virtual DbSet<VwBillDetailOrderCw> VwBillDetailOrderCws { get; set; }

        //public virtual DbSet<VwBillDetailRecord> VwBillDetailRecords { get; set; }

        //public virtual DbSet<VwBillDetailSaleCw> VwBillDetailSaleCws { get; set; }

        //public virtual DbSet<VwBillDetailv1> VwBillDetailv1s { get; set; }

        //public virtual DbSet<VwBillExpense> VwBillExpenses { get; set; }

        //public virtual DbSet<VwBillExpenseSummary> VwBillExpenseSummaries { get; set; }

        //public virtual DbSet<VwBillFarmerCommission> VwBillFarmerCommissions { get; set; }

        //public virtual DbSet<VwBillPaidAmountAccountDetail> VwBillPaidAmountAccountDetails { get; set; }

        //public virtual DbSet<VwBillPaidAmountFinal> VwBillPaidAmountFinals { get; set; }

        //public virtual DbSet<VwBillPaidAmountFinalCw> VwBillPaidAmountFinalCws { get; set; }

        //public virtual DbSet<VwBillPaidAmountFinalIndb> VwBillPaidAmountFinalIndbs { get; set; }

        //public virtual DbSet<VwBillPaidRecord> VwBillPaidRecords { get; set; }

        //public virtual DbSet<VwBillQuantityWeightSummary> VwBillQuantityWeightSummaries { get; set; }

        //public virtual DbSet<VwBillSaleSummary> VwBillSaleSummaries { get; set; }

        //public virtual DbSet<VwBillTotalAmount> VwBillTotalAmounts { get; set; }

        //public virtual DbSet<VwBillTotalAmountCw> VwBillTotalAmountCws { get; set; }

        //public virtual DbSet<VwBillTotalAmountOld> VwBillTotalAmountOlds { get; set; }

        //public virtual DbSet<VwBillTotalAmountReport> VwBillTotalAmountReports { get; set; }

        //public virtual DbSet<VwBillTotalAmountReportCw> VwBillTotalAmountReportCws { get; set; }

        //public virtual DbSet<VwBillTotalPaidAmount> VwBillTotalPaidAmounts { get; set; }

        //public virtual DbSet<VwCashBook> VwCashBooks { get; set; }

        //public virtual DbSet<VwCashBookDiff> VwCashBookDiffs { get; set; }

        //public virtual DbSet<VwCashBookIndb> VwCashBookIndbs { get; set; }

        //public virtual DbSet<VwCashBookReceipt> VwCashBookReceipts { get; set; }

        //public virtual DbSet<VwCashBooksOld> VwCashBooksOlds { get; set; }

        //public virtual DbSet<VwDailyBillPrint> VwDailyBillPrints { get; set; }

        //public virtual DbSet<VwDailyBillPrintOld> VwDailyBillPrintOlds { get; set; }

        //public virtual DbSet<VwExpenceModel> VwExpenceModels { get; set; }

        //public virtual DbSet<VwExport> VwExports { get; set; }

        //public virtual DbSet<VwExportBilti> VwExportBiltis { get; set; }

        //public virtual DbSet<VwExportBiltiFinal> VwExportBiltiFinals { get; set; }

        //public virtual DbSet<VwExportBiltiFinalOld> VwExportBiltiFinalOlds { get; set; }

        //public virtual DbSet<VwExportBiltiOld> VwExportBiltiOlds { get; set; }

        //public virtual DbSet<VwExportCommission> VwExportCommissions { get; set; }

        //public virtual DbSet<VwExportItem> VwExportItems { get; set; }

        //public virtual DbSet<VwExportItemOld> VwExportItemOlds { get; set; }

        //public virtual DbSet<VwExportItemQuantity> VwExportItemQuantities { get; set; }

        //public virtual DbSet<VwExportMasterPrint> VwExportMasterPrints { get; set; }

        //public virtual DbSet<VwExportMasterPrintCw> VwExportMasterPrintCws { get; set; }

        //public virtual DbSet<VwExportMasterPrintOld> VwExportMasterPrintOlds { get; set; }

        //public virtual DbSet<VwExportsOld> VwExportsOlds { get; set; }

        //public virtual DbSet<VwFarmerPhoneAndBankDetail> VwFarmerPhoneAndBankDetails { get; set; }

        //public virtual DbSet<VwFinalReportExport> VwFinalReportExports { get; set; }

        //public virtual DbSet<VwFinalReportExportPart1> VwFinalReportExportPart1s { get; set; }

        //public virtual DbSet<VwHammaliAmount> VwHammaliAmounts { get; set; }

        //public virtual DbSet<VwItemSaleSummary> VwItemSaleSummaries { get; set; }

        //public virtual DbSet<VwLedgerDetail> VwLedgerDetails { get; set; }

        //public virtual DbSet<VwManageAccountTransaction> VwManageAccountTransactions { get; set; }

        //public virtual DbSet<VwManageCarat> VwManageCarats { get; set; }

        //public virtual DbSet<VwManageHammali> VwManageHammalis { get; set; }

        //public virtual DbSet<VwManageHammaliBill> VwManageHammaliBills { get; set; }

        //public virtual DbSet<VwManageHammaliExport> VwManageHammaliExports { get; set; }

        //public virtual DbSet<VwMandiBookv1> VwMandiBookv1s { get; set; }

        //public virtual DbSet<VwNakalFarmer> VwNakalFarmers { get; set; }

        //public virtual DbSet<VwPanaDetailsWithExportItem> VwPanaDetailsWithExportItems { get; set; }

        //public virtual DbSet<VwPanaDetailsWithOpening> VwPanaDetailsWithOpenings { get; set; }

        //public virtual DbSet<VwPanadetail> VwPanadetails { get; set; }

        //public virtual DbSet<VwPanadetailsAll> VwPanadetailsAlls { get; set; }

        //public virtual DbSet<VwPanadetailsIndb> VwPanadetailsIndbs { get; set; }

        //public virtual DbSet<VwPanadetailsKharidi> VwPanadetailsKharidis { get; set; }

        //public virtual DbSet<VwPanadetailsOld> VwPanadetailsOlds { get; set; }

        //public virtual DbSet<VwPanadetailsSale> VwPanadetailsSales { get; set; }

        //public virtual DbSet<VwPanadetailsSaleAll> VwPanadetailsSaleAlls { get; set; }

        //public virtual DbSet<VwPanadetailsSaleIndb> VwPanadetailsSaleIndbs { get; set; }

        //public virtual DbSet<VwPanadetailsSaleMissingPana> VwPanadetailsSaleMissingPanas { get; set; }

        //public virtual DbSet<VwPartyKhata1> VwPartyKhata1s { get; set; }

        //public virtual DbSet<VwPartyKhata2> VwPartyKhata2s { get; set; }

        //public virtual DbSet<VwPartyKhata3> VwPartyKhata3s { get; set; }

        //public virtual DbSet<VwPartyKhatum> VwPartyKhata { get; set; }

        //public virtual DbSet<VwRateDiff> VwRateDiffs { get; set; }

        //public virtual DbSet<VwRateDiff1> VwRateDiff1s { get; set; }

        //public virtual DbSet<VwRateDiff2> VwRateDiff2s { get; set; }

        //public virtual DbSet<VwRateDiffBillFinal> VwRateDiffBillFinals { get; set; }

        //public virtual DbSet<VwRateDiffBillFinal1> VwRateDiffBillFinal1s { get; set; }

        //public virtual DbSet<VwRateDiffBillSale> VwRateDiffBillSales { get; set; }

        //public virtual DbSet<VwRateDiffBillSale1> VwRateDiffBillSale1s { get; set; }

        //public virtual DbSet<VwRateDiffSale> VwRateDiffSales { get; set; }

        //public virtual DbSet<VwRateDiffSale1> VwRateDiffSale1s { get; set; }

        //public virtual DbSet<VwRateDiffSale2> VwRateDiffSale2s { get; set; }

        //public virtual DbSet<VwRateDiffSaleDateDetail> VwRateDiffSaleDateDetails { get; set; }

        //public virtual DbSet<VwStock> VwStocks { get; set; }

        //public virtual DbSet<VwUserDetail> VwUserDetails { get; set; }

        #endregion

    }
}
