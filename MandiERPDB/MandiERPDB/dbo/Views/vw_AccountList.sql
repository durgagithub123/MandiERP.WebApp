/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View [dbo].[vw_AccountList] As
SELECT     dbo.Accounts.AccountName ,dbo.AccountTransactions.fkAccountID, SUM(dbo.AccountTransactions.CreditAmount) AS CreditAmount, 
                      SUM(dbo.AccountTransactions.DebitAmount) AS DebitAmount, ISNULL(SUM(dbo.AccountTransactions.CreditAmount), 0) 
                      - ISNULL(SUM(dbo.AccountTransactions.DebitAmount), 0) AS Balance, dbo.Accounts.fkAccountTypeID
FROM         dbo.AccountTransactions INNER JOIN
                      dbo.Accounts ON dbo.AccountTransactions.fkAccountID = dbo.Accounts.AccountID

GROUP BY dbo.AccountTransactions.fkAccountID, dbo.Accounts.AccountName, dbo.Accounts.fkAccountTypeID
