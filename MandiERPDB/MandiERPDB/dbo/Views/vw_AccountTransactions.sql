CREATE VIEW [dbo].[vw_AccountTransactions]
AS
SELECT     dbo.Accounts.fkVillageID, dbo.Accounts.AccountID, dbo.Accounts.AccountFirmName, dbo.Accounts.AccountFirmNameHindi, dbo.Accounts.AccountSortName, dbo.Accounts.AccountName, 
                      dbo.Accounts.AccountNameHindi, dbo.Accounts.AccountMobileNo, dbo.AccountTransactions.VoucherNo, dbo.AccountTransactions.AccountTransactionID, dbo.AccountTransactions.ChequeNo, 
                      dbo.AccountTransactions.RecieptType, dbo.AccountTransactions.fkBillID, dbo.AccountTransactions.fkBillDetailID, dbo.AccountTransactions.fkExportMasterID, 
                      dbo.AccountTransactions.fkExportItemDetailID, dbo.AccountTransactions.TransactionDate, dbo.AccountTransactions.TransactionDetail, dbo.AccountTransactions.Folio, 
                      dbo.AccountTransactions.DebitAmount, dbo.AccountTransactions.CreditAmount, dbo.AccountTransactions.IsDebitOrCredit, dbo.AccountTransactions.Remark, dbo.AccountTransactions.Comment, 
                      dbo.AccountTransactions.fkBranchID, dbo.Villages.VillageName, dbo.AccountTransactions.IsActive, dbo.Accounts.fkAccountTypeID, 0.00 AS OpeningBalance, 
                      dbo.AccountTransactions.BalanceAmount
FROM         dbo.Accounts INNER JOIN
                      dbo.AccountTransactions ON dbo.Accounts.AccountID = dbo.AccountTransactions.fkAccountID LEFT OUTER JOIN
                      dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID

