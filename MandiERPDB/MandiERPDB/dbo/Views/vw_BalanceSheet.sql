/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View [dbo].[vw_BalanceSheet] As
SELECT     AccountTypes.AccountTypeName, SUM(AccountTransactions.CreditAmount) AS CreditAmount, SUM(AccountTransactions.DebitAmount) AS DebitAmount, 
                      ISNULL(SUM(AccountTransactions.CreditAmount), 0) - ISNULL(SUM(AccountTransactions.DebitAmount), 0) AS Balance, AccountTypes.AccountTypeID
FROM         AccountTransactions INNER JOIN
                      Accounts ON AccountTransactions.fkAccountID = Accounts.AccountID RIGHT OUTER JOIN
                      AccountTypes ON Accounts.fkAccountTypeID = AccountTypes.AccountTypeID
GROUP BY AccountTypes.AccountTypeID, AccountTypes.AccountTypeName
