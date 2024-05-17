CREATE View [dbo].[vw_BalanceSheetDetails]
as
SELECT AccountTypes.AccountTypeName, SUM(AccountTransactions.CreditAmount) AS CreditAmount
, SUM(AccountTransactions.DebitAmount) AS DebitAmount
,ISNULL(SUM(AccountTransactions.CreditAmount), 0) - ISNULL(SUM(AccountTransactions.DebitAmount), 0) AS Balance
, AccountTypes.AccountTypeID 
FROM  AccountTransactions with(nolock) INNER JOIN Accounts with(nolock) ON AccountTransactions.fkAccountID = Accounts.AccountID 
inner JOIN AccountTypes ON Accounts.fkAccountTypeID = AccountTypes.AccountTypeID 
--where AccountTransactions.IsActive !='0' And convert(varchar(10), Accounttransactions.TransactionDate,112) > = CONVERT(varchar(10), convert(datetime, '5/11/2016 12:00:00 AM'),112) and convert(varchar(10),Accounttransactions.TransactionDate,112) < = CONVERT(varchar(10), convert(datetime, '5/11/2016 12:00:00 AM'),112) and AccountID ! = dbo.fun_GetCompanyID()
-- and Accounts.AccountID  != (select dbo.fun_GetCompanyID())
GROUP BY AccountTypes.AccountTypeID, AccountTypes.AccountTypeName
