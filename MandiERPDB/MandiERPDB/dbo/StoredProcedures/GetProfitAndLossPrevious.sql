--Test Case : [GetProfitAndLoss] '08/21/2016','08/21/2017'	,0	,0	,'4,5,15,28','Y'
--[GetProfitAndLoss] '01/21/2016','08/21/2018'	,0	,0	,'4,','Y'
--[GetProfitAndLoss] '01/21/2016','08/21/2018'	,0	,0	,'','Y',0
CREATE PROC [dbo].[GetProfitAndLossPrevious] (
	@FromDate DATETIME
	,@ToDate DATETIME
	,@HideRateDiff INT
	,@HideExpoDiff INT
	,@HideDataIN VARCHAR(100)
	,@IsMandiSulkShow VARCHAR(10) = 'Y'
	,@IsTentativeExportShow bit = 0
	)
AS
BEGIN
	DECLARE @AccountIDs VARCHAR(max)

	SET @AccountIDs = (
			SELECT dbo.fun_ProfitLossAccountIDs()
			)

	IF (@IsMandiSulkShow != 'Y')
	begin
		SET @AccountIDs = replace(@AccountIDs, '27,', '')
		SET @AccountIDs = replace(@AccountIDs, '12,', '')
	end
	print @AccountIDs
	IF (
			Len(@HideDataIN) > 0
			AND Len(@AccountIDs) > 0
			)
		SET @HideDataIN = @HideDataIN

	PRINT @HideDataIN

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
		AND fkAccountID NOT IN (
			SELECT items
			FROM dbo.Split(@HideDataIN, ',')
			)
		and fkAccountID not in (24,25)	
			
		AND (fkAccountID IN (
			SELECT items
			FROM dbo.Split(@AccountIDs, ',')
			)
			or ( (patindex('4,',@HideDataIN) > 0  or  fkAccountTypeID in( 17))))
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
	IF (@HideRateDiff = 0)
	BEGIN
		INSERT INTO @tbl
		SELECT 'Rate Difference' AS AccountName
			,sum(SalesTotalAmountwCommision) AS CreditAmount
			,sum(BillTotalAmountwCommission) AS DebitAmount
			,sum(SalesTotalAmountwCommision) - sum(BillTotalAmountwCommission) AS Balance
			,0
			,0
		FROM vw_RateDiff
		WHERE IsCompanyAccount = 0
			--AND (CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
			--AND (CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
			AND BillID IN (
				SELECT BillID
				FROM vw_RateDiff
				WHERE (CONVERT(VARCHAR(10), SaleDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
					AND (CONVERT(VARCHAR(10), SaleDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
					AND IsActive != '0'
				)
			AND IsActive != '0'
	END

	INSERT INTO @tbl
	SELECT 'Rate Difference Purchase' AS AccountName
		,convert(DECIMAL(10, 0), sum(SalesTotalAmountwCommision)) AS CreditAmount
		,convert(DECIMAL(10, 0), sum(BillTotalAmountwCommission)) AS DebitAmount
		,convert(DECIMAL(10, 0), sum(SalesTotalAmountwCommision)) - convert(DECIMAL(10, 0), sum(BillTotalAmountwCommission)) AS Balance
		,0
		,0
	FROM vw_RateDiff
	WHERE IsCompanyAccount = 1
		--AND (CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
		--AND (CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
		AND billid IN (
			SELECT BillID
			FROM vw_RateDiff
			WHERE (CONVERT(VARCHAR(10), SaleDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
				AND (CONVERT(VARCHAR(10), SaleDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
			)
		AND IsActive != '0'

	--	INSERT INTO @tbl
	--SELECT 'Rate Difference' AS AccountName
	--		,sum(salesTotalAmount) AS CreditAmount
	--		,sum(BillTotalAmount) AS DebitAmount
	--		,sum(salesTotalAmount) - sum(BillTotalAmount) AS Balance
	--		,0
	--		,0
	--	FROM vw_RateDiffSale
	--	WHERE IsCompanyAccount = 0
	--		AND (CONVERT(VARCHAR(10), SaleDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
	--		AND (CONVERT(VARCHAR(10), SaleDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
	--		AND IsActive != '0'
	--	INSERT INTO @tbl
	--	SELECT 'Rate Difference Purchase' AS AccountName
	--		,convert(DECIMAL(10, 0), sum(SalesTotalAmountwCommision)) AS CreditAmount
	--		,convert(DECIMAL(10, 0), sum(BillTotalAmountwCommission)) AS DebitAmount
	--		,convert(DECIMAL(10, 0), sum(SalesTotalAmountwCommision)) - convert(DECIMAL(10, 0), sum(BillTotalAmountwCommission)) AS Balance
	--		,0
	--		,0
	--	FROM vw_RateDiffSale
	--	WHERE IsCompanyAccount = 1
	--		AND (CONVERT(VARCHAR(10), SaleDate, 112) >= CONVERT(VARCHAR(10), CONVERT(DATETIME, @FromDate), 112))
	--		AND (CONVERT(VARCHAR(10), SaleDate, 112) <= CONVERT(VARCHAR(10), CONVERT(DATETIME, @ToDate), 112))
	--		AND IsActive != '0'
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
	IF (@HideExpoDiff = 0)
	BEGIN
		DECLARE @TotalSaleandCommisssionAmount FLOAT

		SELECT @TotalSaleandCommisssionAmount = sum(TotalAmount)
		FROM ItemSaleDetails
		WHERE IsActive != '0'
			AND ItemSaleDetailID IN (
				SELECT fkItemSaleDetailID
				FROM ExportItemDetails
				INNER JOIN ExportMasters ON ExportMasterID = fkExportMasterID
				WHERE ExportItemDetails.IsActive != '0'
					AND CONVERT(VARCHAR(10), [BiltiDate], 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
					AND CONVERT(VARCHAR(10), [BiltiDate], 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
				)

		INSERT INTO @tbl
		SELECT 'Export Difference' AS AccountName
			,Sum(ISNULL(BillNetExportAmount, 0)) AS CreditAmount
			,isnull(@TotalSaleandCommisssionAmount, 0) + sum(isnull(MandiSulk, 0)) + sum(isnull(TotalHammali, 0)) + sum(isnull(AdvanceBhada, 0)) + sum(isnull(FakeMandiAmount, 0)) + sum(isnull(FakeMandiPercent, 0)) AS DebitAmount
			,((isnull(Sum(isnull(BillNetExportAmount, 0)), 0) - Isnull((isnull(@TotalSaleandCommisssionAmount, 0) + sum(isnull(MandiSulk, 0)) + sum(isnull(TotalHammali, 0)) + sum(isnull(AdvanceBhada, 0)) + sum(isnull(FakeMandiAmount, 0)) + sum(isnull(FakeMandiPercent, 0))), 0))) AS Balance
			,0
			,0
		FROM [dbo].[ExportMasters]
		WHERE CONVERT(VARCHAR(10), [BiltiDate], 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
			AND CONVERT(VARCHAR(10), [BiltiDate], 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
	END
	
	
	if(@IsTentativeExportShow = 1)
	begin
		DECLARE @TotalSaleandCommisssionAmountPending FLOAT

		SELECT @TotalSaleandCommisssionAmountPending = sum(TotalAmount)
		FROM ItemSaleDetails
		WHERE IsActive != '0'
			AND ItemSaleDetailID IN (
				SELECT fkItemSaleDetailID
				FROM ExportItemDetails
				INNER JOIN ExportMasters ON ExportMasterID = fkExportMasterID
				WHERE ExportItemDetails.IsActive != '0'
					AND CONVERT(VARCHAR(10), [BiltiDate], 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
					AND CONVERT(VARCHAR(10), [BiltiDate], 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
					and ISNULL(BillNetExportAmount, 0) = 0
				)

		INSERT INTO @tbl
		SELECT 'Export Pending Amount' AS AccountName
			,isnull(@TotalSaleandCommisssionAmountPending, 0) + sum(isnull(MandiSulk, 0)) + sum(isnull(TotalHammali, 0)) + sum(isnull(AdvanceBhada, 0)) + sum(isnull(FakeMandiAmount, 0)) + sum(isnull(FakeMandiPercent, 0)) AS CreditAmount
			,0 as DebitAmount
			,isnull(@TotalSaleandCommisssionAmountPending, 0) + sum(isnull(MandiSulk, 0)) + sum(isnull(TotalHammali, 0)) + sum(isnull(AdvanceBhada, 0)) + sum(isnull(FakeMandiAmount, 0)) + sum(isnull(FakeMandiPercent, 0)) AS Balance
			,0
			,0
		FROM [dbo].[ExportMasters]
		WHERE CONVERT(VARCHAR(10), [BiltiDate], 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
			AND CONVERT(VARCHAR(10), [BiltiDate], 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
			and ISNULL(BillNetExportAmount, 0) = 0
	end

	SELECT *
	FROM @tbl
END
