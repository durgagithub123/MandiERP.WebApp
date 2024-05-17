create view [dbo].[vw_AccountFinal]
as
SELECT     vw_AccountTransactions.AccountFirmName, vw_AccountTransactions.AccountID, vw_AccountTransactions.AccountFirmNameHindi, 
                      vw_AccountTransactions.AccountSortName, vw_AccountTransactions.AccountName, vw_AccountTransactions.AccountNameHindi, 
                      vw_AccountTransactions.AccountMobileNo, vw_AccountTransactions.fkBillID, vw_AccountTransactions.fkBillDetailID, vw_AccountTransactions.fkExportMasterID, 
                      vw_AccountTransactions.fkExportItemDetailID, vw_AccountTransactions.TransactionDate, vw_AccountTransactions.TransactionDetail, vw_AccountTransactions.Folio, 
                      vw_AccountTransactions.DebitAmount, vw_AccountTransactions.CreditAmount, vw_AccountTransactions.IsDebitOrCredit, vw_AccountTransactions.Remark, 
                      vw_AccountTransactions.Comment, vw_ManageAccountTransaction.Debit as TotalDebit, vw_ManageAccountTransaction.Credit as TotalCredit, vw_ManageAccountTransaction.Balance as TotalBalance
FROM         vw_AccountTransactions INNER JOIN
                      vw_ManageAccountTransaction ON vw_AccountTransactions.AccountID = vw_ManageAccountTransaction.AccountID
