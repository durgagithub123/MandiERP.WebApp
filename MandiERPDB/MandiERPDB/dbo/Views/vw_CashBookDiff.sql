CREATE view [dbo].[vw_CashBookDiff]
as

SELECT  0 as Sno,   Accounts.AccountName, Accounts.AccountFirmName, Accounts.AccountID, Accounts.AccountMobileNo, Accounts.AccountPhoneNo, Accounts.AccountCity, 
                      AccountTransactions.AccountTransactionID, AccountTransactions.TransactionDate, AccountTransactions.Remark, AccountTransactions.Comment, 
                      AccountTransactions.DebitAmount, AccountTransactions.CreditAmount, AccountTransactions.IsDebitOrCredit, AccountTransactions.PanaFlag, 
                      isnull(AccountTransactions.PanaAspectedAmount,0) as PanaAspectedAmount, AccountTransactions.PanaActualAmount, AccountTransactions.PanaPaidAmount, AccountTransactions.PanaDiscount, 
                      AccountTransactions.PanaPercent, AccountTransactions.PanaSystemPercent, Accounts.fkVillageID, AccountTransactions.fkItemSaleDetailID, 
                      AccountTransactions.fkCashBookID, AccountTransactions.fkBillID
					  ,isnull(AccountTransactions.PanaAspectedAmount,0)- isnull(AccountTransactions.PanaPaidAmount,0) as DiffAspectAndPaid 
FROM         Accounts INNER JOIN
                      AccountTransactions ON Accounts.AccountID = AccountTransactions.fkAccountID
                      where isnull(PanaActualAmount,0) > 0 and AccountTransactions.IsActive != '0'
