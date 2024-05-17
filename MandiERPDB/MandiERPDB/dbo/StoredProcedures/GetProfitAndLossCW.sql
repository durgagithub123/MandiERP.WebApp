--Test Case : [GetProfitAndLoss] '06/28/2019','06/28/2021'	,0	,0	,'4,5,15,28','Y',0,1
Create PROC [dbo].[GetProfitAndLossCW] (
	@FromDate DATETIME
	,@ToDate DATETIME
	,@HideRateDiff INT
	,@HideExpoDiff INT
	,@HideDataIN VARCHAR(100)
	,@IsMandiSulkShow VARCHAR(10) = 'Y'
	,@IsTentativeExportShow bit = 0
	,@IncludeCapitalAmount bit = 0
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
		AND fkAccountID IN (
			SELECT items
			FROM dbo.Split(@AccountIDs, ',')
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

	IF (@HideRateDiff = 0)
	BEGIN
		INSERT INTO @tbl
	
	SELECT 'Rate Difference'
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
		AND fkAccountID IN (24)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
	GROUP BY
		--dbo.AccountTransactions.fkAccountID
		--	,dbo.Accounts.AccountName	,
		dbo.Accounts.fkAccountTypeID
	
	END

	INSERT INTO @tbl
	SELECT 'Rate Difference Purchase'
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
		AND fkAccountID IN (25)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
	GROUP BY
		--dbo.AccountTransactions.fkAccountID
		--	,dbo.Accounts.AccountName	,
		dbo.Accounts.fkAccountTypeID
	
	INSERT INTO @tbl
	SELECT 'Commission Sale' AS AccountName
		,sum(CreditAmount) AS CreditAmount
		,0 AS DebitAmount
		--,(sum(SalesTotalAmountwCommision) - sum(salesTotalAmount)) - (sum(BillTotalAmountwCommission)-sum(BillTotalAmount))  AS Balance
		,sum(CreditAmount) AS Balance
		,0
		,0
	FROM AccountTransactions
	WHERE  fkAccountID IN (10)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
	AND IsActive != '0'

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
	
if(@IncludeCapitalAmount = 1)
begin
	INSERT INTO @tbl
	SELECT 'Capital Account'
		,SUM(dbo.AccountTransactions.CreditAmount) AS CreditAmount
		,SUM(dbo.AccountTransactions.DebitAmount) AS DebitAmount
		,ISNULL(SUM(dbo.AccountTransactions.CreditAmount), 0) - ISNULL(SUM(dbo.AccountTransactions.DebitAmount), 0) AS Balance
		,0
		,0
	--,null
	FROM dbo.AccountTransactions
	INNER JOIN dbo.Accounts ON dbo.AccountTransactions.fkAccountID = dbo.Accounts.AccountID
	WHERE AccountTransactions.IsActive != '0'
		AND fkAccountID IN (1)
		--AND fkAccountID IN (25)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) > = CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112)
		AND convert(VARCHAR(10), Accounttransactions.TransactionDate, 112) < = CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112)
	GROUP BY
		--dbo.AccountTransactions.fkAccountID
		--	,dbo.Accounts.AccountName	,
		dbo.Accounts.fkAccountTypeID
	
end
	
	
	SELECT *
	FROM @tbl
END
