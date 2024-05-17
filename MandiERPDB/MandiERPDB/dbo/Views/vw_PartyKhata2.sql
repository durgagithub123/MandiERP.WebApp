CREATE VIEW [dbo].[vw_PartyKhata2]
AS
SELECT     dbo.AccountTransactions.fkAccountID, dbo.AccountTransactions.TransactionDate, 0 AS NetWeight, 0 AS Quantity, SUM(dbo.AccountTransactions.CreditAmount) 
                      AS CreditAmount, SUM(dbo.AccountTransactions.DebitAmount) AS DebitAmount, dbo.AccountTransactions.IsDebitOrCredit, dbo.Accounts.AccountName
FROM         dbo.Accounts INNER JOIN
                      dbo.AccountTransactions ON dbo.Accounts.AccountID = dbo.AccountTransactions.fkAccountID INNER JOIN
                      dbo.CashBooks ON dbo.Accounts.AccountID = dbo.CashBooks.fkAccountID AND dbo.AccountTransactions.fkCashBookID = dbo.CashBooks.CashBookID
WHERE     (dbo.AccountTransactions.fkCashBookID > 0)
GROUP BY dbo.AccountTransactions.TransactionDate, dbo.AccountTransactions.fkAccountID, dbo.AccountTransactions.IsDebitOrCredit, dbo.Accounts.AccountName
