CREATE PROC BillExpensesAT_Upsert @BillID INT = 1
	,@ExpenseTypeFilter VARCHAR(10) = 'Bill'
AS
BEGIN
	DECLARE @TransactionDate DATE = getdate()

	SELECT @TransactionDate = BillDate
	FROM Bills
	WHERE BillID = @BillID

	UPDATE att
	SET [CreditAmount] = e.KeyValue
		--,[Remark]                                     
		,[Comment] = [Comment] + '-M'
		,[ModifyDate] = getdate()
		,IsActive = ''
	FROM [dbo].[fnGetBillExpenses](@BillID,@ExpenseTypeFilter) AS e
	INNER JOIN AccountTransactions att ON e.AccountID = att.fkAccountID
		AND e.BillID = att.fkBillID
	WHERE att.AccountTransactionID IS NOT NULL
		AND e.KeyValue != [CreditAmount]
		AND e.KeyValue != 0

	UPDATE att
	SET [CreditAmount] = e.KeyValue
		--,[Remark]                                     
		,[Comment] = [Comment] + '-M'
		,[ModifyDate] = getdate()
		,IsActive = '0'
	FROM [dbo].[fnGetBillExpenses](@BillID,@ExpenseTypeFilter) AS e
	INNER JOIN AccountTransactions att ON e.AccountID = att.fkAccountID
		AND e.BillID = att.fkBillID
	WHERE att.AccountTransactionID IS NOT NULL
		AND e.KeyValue != [CreditAmount]
		AND e.KeyValue = 0

	INSERT INTO [dbo].[AccountTransactions] (
		[AccountTransactionNo]
		,[AccountTransactionCode]
		,[AccountTransactionDetail]
		,[VoucherNo]
		,[VoucherType]
		,[CashorBankAccount]
		,[ChequeNo]
		,[RecieptType]
		,[fkAccountID]
		,[fkAccountType]
		,[fkVillageID]
		,[VillageName]
		,[IsCompanyAccount]
		,[AccountHolder]
		,[fkBillID]
		,[fkBillDetailID]
		,[fkExportMasterID]
		,[fkExportItemDetailID]
		,[TransactionDate]
		,[TransactionDetail]
		,[Folio]
		,[DebitAmount]
		,[CreditAmount]
		,[IsDebitOrCredit]
		,[BalanceAmount]
		,[Remark]
		,[Comment]
		,[fkBranchID]
		,[IsActive]
		,[InsertDate]
		,[ModifyDate]
		,[CreatedBy]
		,[ModifiedBy]
		,[fkCashBookID]
		,[fkItemSaleDetailID]
		,[PanaFlag]
		,[PanaActualAmount]
		,[PanaAspectedAmount]
		,[PanaPaidAmount]
		,[PanaDiscount]
		,[PanaPercent]
		,[PanaSystemPercent]
		,[IsExport]
		,[IsPurchase]
		,[IsSale]
		,[RemarkItemSale]
		,[PurchaseAmount]
		,[SaleAmount]
		,[RateDiffAmount]
		,[fkBillPaymentID]
		,[TableName]
		,[KeyColumn]
		,[KeyValue]
		,[KeyDescription]
		)
	SELECT 0 AS [AccountTransactionNo]
		,'' AS [AccountTransactionCode]
		,'' AS [AccountTransactionDetail]
		,'' AS [VoucherNo]
		,'' AS [VoucherType]
		,'' AS [CashorBankAccount]
		,'' AS [ChequeNo]
		,'' AS [RecieptType]
		,e.AccountID AS [fkAccountID]
		,'0' AS [fkAccountType]
		,'0' AS [fkVillageID]
		,'' AS [VillageName]
		,'' AS [IsCompanyAccount]
		,'' AS [AccountHolder]
		,e.BillID AS [fkBillID]
		,NULL AS [fkBillDetailID]
		,NULL AS [fkExportMasterID]
		,NULL AS [fkExportItemDetailID]
		,@TransactionDate AS [TransactionDate]
		,'AutoBill#' + Convert(VARCHAR(10), e.BillID) AS [TransactionDetail]
		,'' AS [Folio]
		,0 AS [DebitAmount]
		,e.KeyValue AS [CreditAmount]
		,'C' AS [IsDebitOrCredit]
		,0 AS [BalanceAmount]
		,'To Bill Expense B#' + Convert(VARCHAR(10), e.BillID) AS [Remark]
		,'To Bill Expense B#' + Convert(VARCHAR(10), e.BillID) AS [Comment]
		,'' AS [fkBranchID]
		,'' AS [IsActive]
		,Getdate() AS [InsertDate]
		,GetDate() AS [ModifyDate]
		,'' AS [CreatedBy]
		,'' AS [ModifiedBy]
		,'' AS [fkCashBookID]
		,'' AS [fkItemSaleDetailID]
		,'' AS [PanaFlag]
		,'' AS [PanaActualAmount]
		,'' AS [PanaAspectedAmount]
		,'' AS [PanaPaidAmount]
		,'' AS [PanaDiscount]
		,'' AS [PanaPercent]
		,'' AS [PanaSystemPercent]
		,'' AS [IsExport]
		,'' AS [IsPurchase]
		,'1' AS [IsSale]
		,'' AS [RemarkItemSale]
		,'' AS [PurchaseAmount]
		,'' AS [SaleAmount]
		,'' AS [RateDiffAmount]
		,'' AS [fkBillPaymentID]
		,'Bills' AS [TableName]
		,'BillID' AS [KeyColumn]
		,e.BillID AS [KeyValue]
		,e.KeyColumn AS [KeyDescription]
	FROM [dbo].[fnGetBillExpenses](@BillID,@ExpenseTypeFilter) AS e
	LEFT JOIN AccountTransactions att ON e.AccountID = att.fkAccountID
		AND e.BillID = att.fkBillID
	WHERE att.AccountTransactionID IS NULL
		AND e.KeyValue != 0
END
	