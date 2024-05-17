--Test Case : [GetProfitAndLoss] '04/01/2015','03/31/2017'	,0	,0	,'4,5,15'
create PROC [dbo].[GetProfitAndLoss_Backup04Sept16] (
	@FromDate DATETIME
	,@ToDate DATETIME
	,@HideRateDiff INT
	,@HideExpoDiff INT
	,@HideDataIN VARCHAR(20)
	)
AS
BEGIN
	DECLARE @AccountIDs VARCHAR(max)

	SET @AccountIDs = (
			SELECT dbo.fun_ProfitLossAccountIDs()
			)

	IF (
			Len(@HideDataIN) > 0
			AND Len(@AccountIDs) > 0
			)
		SET @HideDataIN = @HideDataIN + ',' + @AccountIDs

	DECLARE @tbl TABLE (
		ID INT identity(1, 1)
		,AccountName VARCHAR(100)
		,CreditAmount FLOAT
		,DebitAmount FLOAT
		,Balance FLOAT
		,fkAccountID INT
		,fkAccountTypeID INT
		)

	--,BillDate varchar(20)
	INSERT INTO @tbl
	--SELECT 'Expenses'
	SELECT dbo.Accounts.AccountName
		,SUM(dbo.AccountTransactions.CreditAmount) AS CreditAmount
		,SUM(dbo.AccountTransactions.DebitAmount) AS DebitAmount
		,ISNULL(SUM(dbo.AccountTransactions.CreditAmount), 0) - ISNULL(SUM(dbo.AccountTransactions.DebitAmount), 0) AS Balance
		,0
		,0
	--,null
	FROM dbo.AccountTransactions
	INNER JOIN dbo.Accounts ON dbo.AccountTransactions.fkAccountID = dbo.Accounts.AccountID
	WHERE AccountTransactions.IsActive != '0'
		AND fkAccountID IN (
			SELECT items
			FROM dbo.Split(@HideDataIN, ',')
			)
		--	and fkAccountTypeID in( 17)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
	GROUP BY dbo.AccountTransactions.fkAccountID
		,dbo.Accounts.AccountName
		,dbo.Accounts.fkAccountTypeID

	INSERT INTO @tbl
	SELECT 'Employee'
		,SUM(dbo.AccountTransactions.CreditAmount) AS CreditAmount
		,SUM(dbo.AccountTransactions.DebitAmount) AS DebitAmount
		,ISNULL(SUM(dbo.AccountTransactions.CreditAmount), 0) - ISNULL(SUM(dbo.AccountTransactions.DebitAmount), 0) AS Balance
		,0
		,0
	--,null
	FROM dbo.AccountTransactions
	INNER JOIN dbo.Accounts ON dbo.AccountTransactions.fkAccountID = dbo.Accounts.AccountID
	WHERE AccountTransactions.IsActive != '0'
		--AND fkAccountID IN (select items from dbo.Split( @HideDataIN,','))
		AND fkAccountTypeID IN (25)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
	GROUP BY
		--dbo.AccountTransactions.fkAccountID
		--	,dbo.Accounts.AccountName	,
		dbo.Accounts.fkAccountTypeID

	--If(@HideRateDiff=0)
	--begin
	--insert into @tbl
	--SELECT 'Rate Difference' AS AccountName
	--	,Sum(ItemSaleNetTotalAmount) AS CreditAmount
	--	,Sum(BillTotalAmount) AS DebitAmount
	--	,ISNULL(Sum(ItemSaleNetTotalAmount),0) - ISNULL(Sum(BillTotalAmount),0) AS Balance
	--	,0
	--	,0
	--	--,CONVERT(VARCHAR(10), BillDate, 103) AS BillDate
	--FROM vw_RateDiffBillSale
	--WHERE (1 = 1)
	--	AND (CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
	--	AND (CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
	----GROUP BY BillDate
	INSERT INTO @tbl
	SELECT 'Rate Difference' AS AccountName
		,sum(salesTotalAmount) AS CreditAmount
		,sum(BillTotalAmount) AS DebitAmount
		,sum(salesTotalAmount) - sum(BillTotalAmount) AS Balance
		,0
		,0
	FROM vw_RateDiff
	WHERE IsCompanyAccount = 0
		AND (CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
		AND (CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
		AND IsActive != '0'

	INSERT INTO @tbl
	SELECT 'Rate Difference Purchase' AS AccountName
		,convert(DECIMAL(10, 0), sum(SalesTotalAmountwCommision)) AS CreditAmount
		,convert(DECIMAL(10, 0), sum(BillTotalAmountwCommission)) AS DebitAmount
		,convert(DECIMAL(10, 0), sum(SalesTotalAmountwCommision)) - convert(DECIMAL(10, 0), sum(BillTotalAmountwCommission)) AS Balance
		,0
		,0
	FROM vw_RateDiff
	WHERE IsCompanyAccount = 1
		AND (CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
		AND (CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
		AND IsActive != '0'

	INSERT INTO @tbl
	SELECT 'Commission Sale' AS AccountName
		,sum([SaleCommissionAmount]) AS CreditAmount
		,0 AS DebitAmount
		--,(sum(SalesTotalAmountwCommision) - sum(salesTotalAmount)) - (sum(BillTotalAmountwCommission)-sum(BillTotalAmount))  AS Balance
		,sum([SaleCommissionAmount]) AS Balance
		,0
		,0
	FROM vw_RateDiff
	WHERE IsCompanyAccount = 0
		AND (CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
		AND (CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
		AND IsActive != '0'

	--insert into @tbl
	--select 'Bill Commission on Company ' AS AccountName
	-- ,sum(CommissionAmount) AS CreditAmount 
	--,0 AS DebitAmount
	-- ,sum(CommissionAmount) AS Balance 
	--,0
	--,0
	-- from ItemSaleDetails 
	--inner join Bills on BillID=fkBillID
	-- where ItemSaleDetails.IsActive != '0' and ItemSaleDetails.fkAccountID=  dbo.fun_GetCompanyID()
	--	and Bills.[IsCompanyAccount] = 0 
	--declare @PurchaseSaleCommission float
	--select @PurchaseSaleCommission= sum(ItemSaleDetails.CommissionAmount)  from ItemSaleDetails inner join Bills
	--on BillID=fkBillID
	--where Bills.IsActive != '0' and Bills.IsCompanyAccount = 1
	--and ItemSaleDetailID not in (select fkItemSaleDetailID from ExportItemDetails )
	--insert into @tbl
	--select 'Commission Purchase sale' AS AccountName
	----, sum(SalesTotalAmountwCommision) - sum(salesTotalAmount) AS CreditAmount 
	--, @PurchaseSaleCommission AS CreditAmount 
	--,sum(BillTotalAmountwCommission)-sum(BillTotalAmount) AS DebitAmount
	--,@PurchaseSaleCommission -(sum(BillTotalAmountwCommission)-sum(BillTotalAmount)) AS Balance
	----,(sum(SalesTotalAmountwCommision) - sum(salesTotalAmount)) - (sum(BillTotalAmountwCommission)-sum(BillTotalAmount))  AS Balance
	--,0
	--,0
	--  from vw_RateDiff
	--where IsCompanyAccount = 1
	--end
	--If(@HideExpoDiff=0)
	--begin
	DECLARE @TotalSaleandCommisssionAmount FLOAT

	SELECT @TotalSaleandCommisssionAmount = sum(TotalAmount)
	FROM ItemSaleDetails
	WHERE IsActive != '0'
		AND ItemSaleDetailID IN (
			SELECT fkItemSaleDetailID
			FROM ExportItemDetails
			WHERE IsActive != '0'
			)

	INSERT INTO @tbl
	SELECT 'Export Difference' AS AccountName
		,Sum(ISNULL(BillNetExportAmount, 0)) AS CreditAmount
		,isnull(@TotalSaleandCommisssionAmount, 0) + sum(isnull(MandiSulk, 0)) + sum(isnull(TotalHammali, 0)) + sum(isnull(AdvanceBhada, 0)) AS DebitAmount
		,((isnull(Sum(isnull(BillNetExportAmount, 0)), 0) - Isnull((isnull(@TotalSaleandCommisssionAmount, 0) + sum(isnull(MandiSulk, 0)) + sum(isnull(TotalHammali, 0)) + sum(isnull(AdvanceBhada, 0))), 0))) AS Balance
		,0
		,0
	FROM [dbo].[ExportMasters]
	WHERE CONVERT(VARCHAR(10), [BiltiDate], 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
		AND CONVERT(VARCHAR(10), [BiltiDate], 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)

	--end
	SELECT *
	FROM @tbl
END
