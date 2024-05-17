CREATE VIEW [dbo].[vw_PartyKhata3]
AS
SELECT     0 AS NetWeight, 0 AS Quantity, dbo.Accounts.fkAccountTypeID, dbo.Accounts.AccountName, dbo.CashBooks.TransactionDate, dbo.CashBooks.DebitAmount, 
                      dbo.CashBooks.CreditAmount, dbo.CashBooks.IsDebitOrCredit, dbo.CashBooks.Remark, dbo.CashBooks.fkAccountID
FROM         dbo.Accounts INNER JOIN
                      dbo.CashBooks ON dbo.Accounts.AccountID = dbo.CashBooks.fkAccountID
