-- Test case [usp_BalanceSheetSummary] '01/01/2014', '01/01/2017'
CREATE PROC [dbo].[usp_BalanceSheetSummary] (
	@FromDate DATETIME = '01/01/2011'
	,@ToDate DATETIME = '01/01/2017'
	)
AS
BEGIN
	SELECT AccountTypes.AccountTypeName
		,SUM(AccountTransactions.DebitAmount) AS DebitAmount
		,SUM(AccountTransactions.CreditAmount) AS CreditAmount
		,ISNULL(SUM(AccountTransactions.CreditAmount), 0) - ISNULL(SUM(AccountTransactions.DebitAmount), 0) AS Balance
		,AccountTypes.AccountTypeID
	FROM AccountTransactions WITH (NOLOCK)
	INNER JOIN Accounts WITH (NOLOCK) ON AccountTransactions.fkAccountID = Accounts.AccountID
	INNER JOIN AccountTypes ON Accounts.fkAccountTypeID = AccountTypes.AccountTypeID
	WHERE AccountTransactions.IsActive != '0'
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), @FromDate, 112)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), @ToDate, 112)
		AND AccountID ! = dbo.fun_GetCompanyID()
		AND Accounts.AccountID != (
			SELECT dbo.fun_GetCompanyID()
			)

			AND Accounts.AccountID != (
			SELECT dbo.fun_GetCashInHandID()
			)
		and Accounts.fkAccountTypeID in (1,7,24)
			-- Select * from AccountTypes where AccountTypeID in (1,7,24)
	GROUP BY AccountTypes.AccountTypeID
		,AccountTypes.AccountTypeName
	
	UNION ALL
	
	SELECT 'Company' AS AccountTypeName
		,SUM(AccountTransactions.CreditAmount) AS DebitAmount
		,SUM(AccountTransactions.DebitAmount) AS CreditAmount
		,ISNULL(SUM(AccountTransactions.DebitAmount), 0) - ISNULL(SUM(AccountTransactions.CreditAmount), 0) AS Balance
		,AccountTypes.AccountTypeID
	FROM AccountTransactions WITH (NOLOCK)
	INNER JOIN Accounts WITH (NOLOCK) ON AccountTransactions.fkAccountID = Accounts.AccountID
	INNER JOIN AccountTypes ON Accounts.fkAccountTypeID = AccountTypes.AccountTypeID
	WHERE AccountTransactions.IsActive != '0'
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), @FromDate, 112)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), @ToDate, 112)
		AND AccountID = dbo.fun_GetCompanyID()
		AND Accounts.AccountID = (
			SELECT dbo.fun_GetCompanyID()
			)
	GROUP BY AccountTypes.AccountTypeID
		,AccountTypes.AccountTypeName
	
	UNION ALL
	
	SELECT TOP 1 'Cash In Hand' AS AccountTypeName
		,isnull(AccountTransactions.DebitAmount, 0) AS DebitAmount
		,isnull(AccountTransactions.CreditAmount, 0) AS CreditAmount
		,ISNULL(AccountTransactions.CreditAmount, 0) - ISNULL(AccountTransactions.DebitAmount, 0) AS Balance
		,AccountTypes.AccountTypeID
	FROM AccountTransactions WITH (NOLOCK)
	INNER JOIN Accounts WITH (NOLOCK) ON AccountTransactions.fkAccountID = Accounts.AccountID
	INNER JOIN AccountTypes ON Accounts.fkAccountTypeID = AccountTypes.AccountTypeID
	WHERE AccountTransactions.IsActive != '0'
		AND AccountTransactions.fkAccountID = 3
		and  AccountTransactionID =
			(select top 1 AccountTransactionID from AccountTransactions with (nolock) 
		order by TransactionDate desc)
END
