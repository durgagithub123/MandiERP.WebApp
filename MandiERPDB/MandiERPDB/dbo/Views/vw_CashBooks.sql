CREATE VIEW [dbo].[vw_CashBooks]
AS
SELECT     dbo.Accounts.AccountName, dbo.Accounts.AccountID, dbo.CashBooks.CashBookID, dbo.CashBooks.CashBookNo, dbo.CashBooks.CashBookCode, dbo.CashBooks.CashBookDetail, 
                      dbo.CashBooks.VoucherNo, dbo.CashBooks.VoucherType, dbo.CashBooks.CashorBankAccount, dbo.CashBooks.ChequeNo, dbo.CashBooks.RecieptType, dbo.CashBooks.fkAccountID, 
                      dbo.CashBooks.fkAccountType, dbo.CashBooks.fkVillageID, dbo.CashBooks.VillageName, dbo.CashBooks.IsCompanyAccount, dbo.CashBooks.AccountHolder, dbo.CashBooks.TransactionDate, 
                      dbo.CashBooks.TransactionDetail, dbo.CashBooks.Folio, dbo.CashBooks.DebitAmount, dbo.CashBooks.CreditAmount, dbo.CashBooks.IsDebitOrCredit, dbo.CashBooks.BalanceAmount, 
                      dbo.CashBooks.Remark, dbo.CashBooks.Comment, dbo.CashBooks.fkBranchID, dbo.CashBooks.IsActive, dbo.CashBooks.InsertDate, dbo.CashBooks.ModifyDate, dbo.CashBooks.CreatedBy, 
                      dbo.CashBooks.ModifiedBy, dbo.CashBooks.fkAccountIDBook
FROM         dbo.Accounts INNER JOIN
                      dbo.CashBooks ON dbo.Accounts.AccountID = dbo.CashBooks.fkAccountID

