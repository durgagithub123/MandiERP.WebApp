-- =============================================
-- Author:		<Arun Patidar>
-- Create date: <18 June 2016>
-- Description:	<Rate diff on Sale/Purchase>
-- TEst case : uspRateDiffSalePurchase 1620
-- select * from BillDetails order by 1 desc
-- =============================================
CREATE PROCEDURE [dbo].[uspRateDiffSalePurchase]
	-- Add the parameters for the stored procedure here
	@BillDetailID INT = 1620
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

			
	Declare @fkAccountID INT
	DECLARE @BillDate DATETIME
		,@SaleDate DATETIME
		,@SaleAmount DECIMAL(18, 2)
		,@PurchaseAmount DECIMAL(18, 2)
		,@DiffAmount DECIMAL(18, 2)
		,@fkBillID BIGINT
		,@IsCompanyAccount INT

	SELECT @IsCompanyAccount = IsCompanyAccount
		,@fkBillID = BillID
		,@billdate = BillDate
		,@saledate = SaleDate
		,@SaleAmount = CASE 
			WHEN isnull(IsCompanyAccount, '0') = '1'
				THEN SalesTotalAmountwCommision
			ELSE SalesTotalAmountwCommision --SalesTotalAmount
			END
		,@PurchaseAmount = CASE 
			WHEN isnull(IsCompanyAccount, '0') = '1'
				THEN BillTotalAmountwCommission
			ELSE BillTotalAmountwCommission -- BillTotalAmount
			END
	FROM dbo.[vw_RateDiffSale]
	WHERE fkBillDetailID = @BillDetailID
	
	
	
	IF Not EXISTS (
			SELECT 1
			FROM [dbo].[vw_ExportItem]
			WHERE RemainQty > 0  and AccountID=(
							SELECT TOP 1 CompanyAccountID
							FROM Configurations
							)
			  and  ItemSaleDetailID IN (
					select ItemSaleDetailID from ItemSaleDetails where fkBillDetailID = @BillDetailID and IsActive != '0'
					)
			)
	BEGIN
		select 1
		Print 'Rate Diff Executed'
		--select * from [dbo].[vw_RateDiffSale]
		-- Insert statements for procedure here
		
		SELECT *
		FROM [vw_RateDiffSale]
		WHERE fkBillDetailID = @BillDetailID

		SELECT @IsCompanyAccount
			,@fkBillID
			,@billdate
			,@saledate
			,@SaleAmount
			,@PurchaseAmount

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
			--,@IsCompanyAccount VARCHAR(50)
			,@AccountHolder NVARCHAR(500)
			,@Folio NVARCHAR(500)
			,@DebitAmount DECIMAL(18, 2) = 0
			,@CreditAmount DECIMAL(18, 2) = 0
			,@IsDebitOrCredit NVARCHAR(50)
			,@BalanceAmount DECIMAL(18, 2)
			,@Remark VARCHAR(200)
			,@Comment VARCHAR(200)
			,@fkBranchID INT
			,@CreatedBy INT
			,@ModifiedBy INT
			--,@fkBillID INT
			,@BalFlag FLOAT
			,@fkCashBookID INT
			,@TransactionDate DATETIME
			,@TransactionDetail VARCHAR(500)
			,@ModifyDate DATETIME

		SET @TransactionDate = @SaleDate

		SELECT @TransactionDate AS TransactionDate

		--Set @BalFlag = (SELECT (Sum(ISnull(CreditAmount,0))-Sum(ISnull(DebitAmount,0))) AS Balance
		--FROM [AccountTransactions] where convert(VARCHAR(10), [TransactionDate], 112)  = Dateadd(day,-1, CONVERT(VARCHAR(10),convert(DATETIME, @TransactionDate), 112))
		--group by [TransactionDate])
		SET @BalFlag = (@SaleAmount - @PurchaseAmount)

		--group by [TransactionDate]
		SELECT @BalFlag

		IF (@BalFlag > 0)
		BEGIN
			SET @CreditAmount = @BalFlag
			SET @IsDebitOrCredit = 'C'
		END
		ELSE
		BEGIN
			SET @BalFlag = (@PurchaseAmount  - @SaleAmount )
			SET @DebitAmount = @BalFlag
			SET @IsDebitOrCredit = 'D'
		END

		SELECT @CreditAmount AS C

		SELECT @DebitAmount AS D

		SET @ModifyDate = getdate()

		IF (@IsCompanyAccount = 1)
			SET @fkAccountID = 25
		ELSE
			SET @fkAccountID = 24

		-- select * from accounts
		SELECT @fkVillageID = VillageID
			,@VillageName = VillageName
		FROM Villages v
		INNER JOIN Accounts A ON A.fkVillageID = v.VillageID
		WHERE AccountID = @fkAccountID

		SELECT 'insertcheck'
			,@DebitAmount
			,@CreditAmount

		IF (
				@DebitAmount > 0
				OR @CreditAmount > 0
				OR @DebitAmount < 0
				OR @CreditAmount < 0
				)
			SELECT 'insert'
				,@DebitAmount
				,@CreditAmount

		SELECT @VoucherNo
			,@fkAccountID
			,0
			,@fkVillageID
			,@VillageName
			,@fkBillID
			,@BillDetailID
			,@TransactionDate
			,@TransactionDetail
			,isnull(@DebitAmount, 0)
			,isnull(@CreditAmount, 0)
			,@IsDebitOrCredit
			,@BalanceAmount
			,'Auto Rate Diff #'
			,@fkBranchID
			,''
			,GETDATE()
			,GETDATE()
			,@CreatedBy
			,@ModifiedBy
			,@fkCashBookID
			,0
			-- For Rate Difff
			,CASE 
				WHEN @IsCompanyAccount = 1
					THEN 1
				ELSE 0
				END --IsPurchase
			,CASE 
				WHEN @IsCompanyAccount = 1
					THEN 0
				ELSE 1
				END --IsSale
			--,'Rate Diff Sale/Purchase' --RemarkItemSale
			,@PurchaseAmount --PurchaseAmount
			,@SaleAmount --SaleAmount
			,@SaleAmount - @PurchaseAmount --RateDiffAmount	

		IF NOT EXISTS (
				SELECT 1
				FROM [AccountTransactions]
				WHERE fkBillDetailID = @BillDetailID
					AND fkAccountID = @fkAccountID
					AND LEFT(remark, 16) = 'Auto Rate Diff #'
				)
		BEGIN
			IF (
					@DebitAmount > 0
					OR @CreditAmount > 0
					OR @DebitAmount < 0
					OR @CreditAmount < 0
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
					-- For Rate Difff
					,IsPurchase
					,IsSale
					--,RemarkItemSale
					,PurchaseAmount
					,SaleAmount
					,RateDiffAmount
					)
				VALUES (
					@VoucherNo
					,@fkAccountID
					,0
					,@fkVillageID
					,@VillageName
					,@fkBillID
					,@BillDetailID
					,@TransactionDate
					,@TransactionDetail
					,isnull(@DebitAmount, 0)
					,isnull(@CreditAmount, 0)
					,@IsDebitOrCredit
					,@BalanceAmount
					,'Auto Rate Diff # - BillID ' + CONVERT(VARCHAR(50), @fkBillID) + ' - SA ' + CONVERT(VARCHAR(50), @SaleAmount) + ' - PA ' + convert(VARCHAR(50), @PurchaseAmount)
					,@fkBranchID
					,''
					,GETDATE()
					,GETDATE()
					,@CreatedBy
					,@ModifiedBy
					,@fkCashBookID
					,0
					-- For Rate Difff
					,CASE 
						WHEN @IsCompanyAccount = 1
							THEN 1
						ELSE 0
						END --IsPurchase
					,CASE 
						WHEN @IsCompanyAccount = 1
							THEN 0
						ELSE 1
						END --IsSale
					--,'Rate Diff Sale/Purchase' --RemarkItemSale
					,@PurchaseAmount --PurchaseAmount
					,@SaleAmount --SaleAmount
					,@SaleAmount - @PurchaseAmount --RateDiffAmount
					)
			END
		END
		ELSE
		BEGIN
			--Update query here 
			UPDATE [AccountTransactions]
			SET [DebitAmount] = @DebitAmount
				,[CreditAmount] = @CreditAmount
				,[IsDebitOrCredit] = @IsDebitOrCredit
				,[BalanceAmount] = @BalanceAmount
				,[ModifyDate] = GETDATE()
				,[TransactionDate] = @TransactionDate
				,SaleAmount = @SaleAmount
				,PurchaseAmount = @PurchaseAmount
				,RateDiffAmount = @PurchaseAmount - @SaleAmount
				,Remark = 'Auto Rate Diff # - BillID ' + CONVERT(VARCHAR(50), @fkBillID) + ' - SA ' + CONVERT(VARCHAR(50), @SaleAmount) + ' - PA ' + convert(VARCHAR(50), @PurchaseAmount)
			WHERE fkBillDetailID = @BillDetailID
				AND LEFT(remark, 16) = 'Auto Rate Diff #'
				AND fkAccountID = @fkAccountID
				--Same for cashbook
		END
	END
	ELSE
	BEGIN
	
		IF (@IsCompanyAccount = 1)
			SET @fkAccountID = 25
		ELSE
			SET @fkAccountID = 24
	
		UPDATE [AccountTransactions]
			SET [DebitAmount] = 0
				,[CreditAmount] = 0
				,[IsDebitOrCredit] = 'C'
				,[BalanceAmount] = 0
				,[ModifyDate] = GETDATE()
				,[TransactionDate] = @billdate
				,SaleAmount = 0
				,PurchaseAmount = 0
				,RateDiffAmount = 0
				,Remark = 'Auto Rate Diff # - BillID ' + CONVERT(VARCHAR(50), @fkBillID) + ' - 0' 
			WHERE fkBillDetailID = @BillDetailID
				AND LEFT(remark, 16) = 'Auto Rate Diff #'
				AND fkAccountID = @fkAccountID
			
	END
END