--Test Case : testRecords '01/01/2015','02/02/2015'
CREATE proc [dbo].[GetProfitAndLoss_old]
(
@FromDate datetime,
@ToDate datetime,
@HideRateDiff int,
@HideExpoDiff int,
@HideDataIN varchar(20)
)
as
begin
DECLARE @tbl TABLE (
	ID INT identity(1, 1)
	,AccountName VARCHAR(100)
	,CreditAmount float
	,DebitAmount float
	,Balance float
	,fkAccountID int
	,fkAccountTypeID int
	--,BillDate varchar(20)
	)
insert into @tbl
SELECT dbo.Accounts.AccountName
	,SUM(dbo.AccountTransactions.CreditAmount) AS CreditAmount
	,SUM(dbo.AccountTransactions.DebitAmount) AS DebitAmount
	,ISNULL(SUM(dbo.AccountTransactions.CreditAmount), 0) - ISNULL(SUM(dbo.AccountTransactions.DebitAmount), 0) AS Balance
	,dbo.AccountTransactions.fkAccountID
	,dbo.Accounts.fkAccountTypeID
	--,null
FROM dbo.AccountTransactions
INNER JOIN dbo.Accounts ON dbo.AccountTransactions.fkAccountID = dbo.Accounts.AccountID
WHERE AccountTransactions.IsActive != '0'
	AND fkAccountID IN (select items from dbo.Split( @HideDataIN,','))
		
	AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
	AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
GROUP BY dbo.AccountTransactions.fkAccountID
	,dbo.Accounts.AccountName
	,dbo.Accounts.fkAccountTypeID
If(@HideRateDiff=0)
begin
insert into @tbl
SELECT 'Rate Difference' AS AccountName
	,Sum(ItemSaleNetTotalAmount) AS CreditAmount
	,Sum(BillTotalAmount) AS DebitAmount
	,ISNULL(Sum(ItemSaleNetTotalAmount),0) - ISNULL(Sum(BillTotalAmount),0) AS Balance
	,0
	,0
	--,CONVERT(VARCHAR(10), BillDate, 103) AS BillDate
FROM vw_RateDiffBillSale
WHERE (1 = 1)
	AND (CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
	AND (CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
--GROUP BY BillDate
end
If(@HideExpoDiff=0)
begin
insert into @tbl
SELECT 'Export Difference' AS AccountName, Sum(BillNetExportAmount) AS CreditAmount, Sum(NetExportAmount) AS DebitAmount,((isnull(Sum(BillNetExportAmount),0)-Isnull(Sum(NetExportAmount),0)))AS Balance,0,0 FROM [dbo].[ExportMasters] where CONVERT(varchar(10), [BiltiDate],112) >= CONVERT(varchar(10), convert(datetime,@FromDate),112)  and CONVERT(varchar(10), [BiltiDate],112)  <= CONVERT(varchar(10), convert(datetime, @ToDate),112) 
end
select * from @tbl

end
