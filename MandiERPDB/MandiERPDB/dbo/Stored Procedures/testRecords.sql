create proc [dbo].[testRecords]
(
@FromDate datetime,
@ToDate datetime
)
as
begin
DECLARE @tbl TABLE (
	ID INT identity(1, 1)
	,AccountName VARCHAR(100)
	,CreditAmout float
	,DebitAmount float
	,Balance float
	,fkAccountID int
	,fkAccountTypeID int
	,BillDate varchar(20)
	)
insert into @tbl
SELECT dbo.Accounts.AccountName
	,SUM(dbo.AccountTransactions.CreditAmount) AS CreditAmount
	,SUM(dbo.AccountTransactions.DebitAmount) AS DebitAmount
	,ISNULL(SUM(dbo.AccountTransactions.CreditAmount), 0) - ISNULL(SUM(dbo.AccountTransactions.DebitAmount), 0) AS Balance
	,dbo.AccountTransactions.fkAccountID
	,dbo.Accounts.fkAccountTypeID
	,null
FROM dbo.AccountTransactions
INNER JOIN dbo.Accounts ON dbo.AccountTransactions.fkAccountID = dbo.Accounts.AccountID
WHERE AccountTransactions.IsActive != '0'
	AND fkAccountID IN (
		4
		,5
		,10
		,15
		)
	AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), convert(DATETIME, '04/29/2015 12:00:00 AM'), 112)
	AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), convert(DATETIME, '04/29/2015 12:00:00 AM'), 112)
GROUP BY dbo.AccountTransactions.fkAccountID
	,dbo.Accounts.AccountName
	,dbo.Accounts.fkAccountTypeID

insert into @tbl
SELECT 'RateDiff' AS AccountName
	,Sum(ItemSaleNetTotalAmount) AS CreditAmount
	,Sum(BillTotalAmount) AS DebitAmount
	,Sum(ItemSaleNetTotalAmount) - Sum(BillTotalAmount) AS Balance
	,0
	,0
	,CONVERT(VARCHAR(10), BillDate, 103) AS BillDate
FROM vw_RateDiffBillSale
WHERE (1 = 1)
	AND (CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, '04/29/2015 12:00:00 AM'), 112))
	AND (CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, '04/29/2015 12:00:00 AM'), 112))
GROUP BY BillDate

select * from @tbl
end
