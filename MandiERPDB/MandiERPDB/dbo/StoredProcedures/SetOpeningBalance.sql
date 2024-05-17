--Test Case - Exec  SetOpeningBalance 3,'04/01/2015 12:00:00 AM','Direct Opening Balance #','05/04/2015 10:55:59 AM','05/04/2015 10:55:59 AM'
CREATE PROC [dbo].[SetOpeningBalance] (
	@fkAccountID BIGINT
	,@TransactionDate DATETIME
	,@TransactionDetail NVARCHAR(500)
	,@InsertDate DATETIME
	,@ModifyDate DATETIME
	)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		DECLARE @CashBookNo BIGINT
			,@CashBookCode VARCHAR(50)
			,@CashBookDetail VARCHAR(50)
			,@VoucherNo BIGINT
			,@VoucherType VARCHAR(50)
			,@CashorBankAccount VARCHAR(50)
			,@ChequeNo VARCHAR(50)
			,@RecieptType VARCHAR(20)
			,@fkAccountType INT
			,@fkVillageID INT
			,@VillageName VARCHAR(50)
			,@IsCompanyAccount VARCHAR(50)
			,@AccountHolder NVARCHAR(500)
			,@Folio NVARCHAR(500)
			,@DebitAmount DECIMAL(18, 2)
			,@CreditAmount DECIMAL(18, 2)
			,@IsDebitOrCredit NVARCHAR(50)
			,@BalanceAmount DECIMAL(18, 2)
			,@Remark VARCHAR(200)
			,@Comment VARCHAR(200)
			,@fkBranchID INT
			,@CreatedBy INT
			,@ModifiedBy int
			,@fkBillID INT
			,@BalFlag FLOAT
			,@fkCashBookID INT
		DECLARE @PreviousDate DATETIME
		DECLARE @LoopFlag BIT
			,@iCount INT

		SET @LoopFlag = 1
		SET @iCount = 0

		SELECT @LoopFlag

		WHILE (@LoopFlag = 1)
		BEGIN
			SET @PreviousDate = Dateadd(day, - 1, @TransactionDate)

			IF EXISTS (
					SELECT 1
					FROM AccountTransactions
					WHERE convert(VARCHAR(10), [TransactionDate], 112) = convert(VARCHAR(10), @PreviousDate, 112)
					)
			BEGIN
				SET @LoopFlag = 0
			END
			ELSE
			BEGIN
				SET @TransactionDate = @PreviousDate
			END

			SELECT @TransactionDate AS TransactionDate

			SET @iCount += 1

			SELECT @iCount AS Counrer

			IF (@iCount = 10)
				SET @LoopFlag = 0
		END

		--Set @BalFlag = (SELECT (Sum(ISnull(CreditAmount,0))-Sum(ISnull(DebitAmount,0))) AS Balance
		--FROM [AccountTransactions] where convert(VARCHAR(10), [TransactionDate], 112)  = Dateadd(day,-1, CONVERT(VARCHAR(10),convert(DATETIME, @TransactionDate), 112))
		--group by [TransactionDate])
		SET @BalFlag = (
				SELECT (Sum(ISnull(CreditAmount, 0)) - Sum(ISnull(DebitAmount, 0)))
				FROM [CashBooks]
				WHERE IsActive != '0' And convert(VARCHAR(10), [TransactionDate], 112) = convert(VARCHAR(10), @PreviousDate, 112)
				)

		--group by [TransactionDate]
		SELECT @BalFlag

		IF (@BalFlag > 0)
		BEGIN
			SET @CreditAmount = @BalFlag
			SET @IsDebitOrCredit = 'C'
		END
		ELSE
		BEGIN
			SET @DebitAmount = @BalFlag
			SET @IsDebitOrCredit = 'D'
		END

		SELECT @CreditAmount AS C

		SELECT @DebitAmount AS D

		SET @VoucherNo = (
				SELECT max(voucherNo) + 1
				FROM CashBooks
				)
		SET @fkCashBookID = (
				SELECT max(cashbookid) + 1
				FROM CashBooks
				)
		SET @ModifyDate = getdate()

		IF NOT EXISTS (
				SELECT 1
				FROM [AccountTransactions]
				WHERE convert(VARCHAR(10), [TransactionDate], 112) = convert(VARCHAR(10), @TransactionDate, 112)
					AND [Remark] = 'Direct Opening Balance #'
				)
		BEGIN
			INSERT INTO [AccountTransactions] (
				[VoucherNo]
				,[fkAccountID]
				,[fkAccountType]
				,[fkVillageID]
				,[VillageName]
				,[fkBillID]
				,[fkBillDetailID]
				,[TransactionDate]
				,[TransactionDetail]
				,[DebitAmount]
				,[CreditAmount]
				,[IsDebitOrCredit]
				,[BalanceAmount]
				,[Remark]
				,[fkBranchID]
				,[IsActive]
				,[InsertDate]
				,[ModifyDate]
				,[CreatedBy]
				,[ModifiedBy]
				,[fkCashBookID]
				,[fkItemSaleDetailID]
				)
			VALUES (
				@VoucherNo
				,@fkAccountID
				,0
				,1
				,''
				,@fkBillID
				,0
				,@TransactionDate
				,@TransactionDetail
				,@DebitAmount
				,@CreditAmount
				,@IsDebitOrCredit
				,@BalanceAmount
				,'Direct Opening Balance #'
				,@fkBranchID
				,''
				,@InsertDate
				,@ModifyDate
				,@CreatedBy
				,@ModifiedBy
				,@fkCashBookID
				,0
				)

			INSERT INTO [CashBooks] (
				[CashBookNo]
				,[VoucherNo]
				,[VoucherType]
				,[CashorBankAccount]
				,[fkAccountID]
				,[fkAccountType]
				,[fkVillageID]
				,[VillageName]
				,[IsCompanyAccount]
				,[AccountHolder]
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
				,[InsertDate]
				,[ModifyDate]
				,[CreatedBy]
				,[ModifiedBy]
				,[fkBillID]
				)
			VALUES (
				@VoucherNo
				,@VoucherNo
				,@VoucherType
				,@CashorBankAccount
				,@fkAccountID
				,0
				,1
				,''
				,@IsCompanyAccount
				,'Cash In Hand'
				,@TransactionDate
				,@TransactionDetail
				,@Folio
				,@DebitAmount
				,@CreditAmount
				,@IsDebitOrCredit
				,@BalanceAmount
				,'Direct Opening Balance #'
				,@Comment
				,@fkBranchID
				,@InsertDate
				,@ModifyDate
				,@CreatedBy
				,@ModifiedBy
				,@fkBillID
				)
		END
		ELSE
		BEGIN
			--Update query here 
			UPDATE [AccountTransactions]
			SET [DebitAmount] = @DebitAmount
				,[CreditAmount] = @CreditAmount
				,[IsDebitOrCredit] = @IsDebitOrCredit
				,[BalanceAmount] = @BalanceAmount
				,[ModifyDate] = @ModifyDate
			WHERE convert(VARCHAR(10), [TransactionDate], 112) = convert(VARCHAR(10), @TransactionDate, 112)
				AND [Remark] = 'Direct Opening Balance #'
				AND @fkAccountID = 3

			--Same for cashbook
			UPDATE [CashBooks]
			SET [DebitAmount] = @DebitAmount
				,[CreditAmount] = @CreditAmount
				,[IsDebitOrCredit] = @IsDebitOrCredit
				,[BalanceAmount] = @BalanceAmount
				,[ModifyDate] = @ModifyDate
			WHERE convert(VARCHAR(10), [TransactionDate], 112) = convert(VARCHAR(10), @TransactionDate, 112)
				AND [Remark] = 'Direct Opening Balance #'
				AND @fkAccountID = 3
		END

		COMMIT
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
	END CATCH
END
