CREATE FUNCTION [dbo].[fun_getFarmerNameByItemSaleDetailID] (
	-- Add the parameters for the function here    
	@ItemSaleDetailID INT
	,@FullNameFlag VARCHAR(10)
	)
RETURNS VARCHAR(250)
AS
BEGIN
	DECLARE @Result VARCHAR(250)

	IF (@FullNameFlag = '')
	BEGIN
		--SELECT        Accounts.AccountFirmName, Accounts.AccountSortName, Accounts.AccountName    
		SELECT @Result = Accounts.AccountName
		FROM Accounts
		INNER JOIN Bills ON Accounts.AccountID = Bills.fkAccountID
		INNER JOIN BillDetails ON Bills.BillID = BillDetails.fkBillID
		INNER JOIN ItemSaleDetails ON BillDetails.BillDetailID = ItemSaleDetails.fkBillDetailID
		WHERE ItemSaleDetails.ItemSaleDetailID = @ItemSaleDetailID
	END
	ELSE
	BEGIN
		SELECT @Result = Accounts.AccountName
		FROM Accounts
		INNER JOIN Bills ON Accounts.AccountID = Bills.fkAccountID
		INNER JOIN BillDetails ON Bills.BillID = BillDetails.fkBillID
		INNER JOIN ItemSaleDetails ON BillDetails.BillDetailID = ItemSaleDetails.fkBillDetailID
		WHERE ItemSaleDetails.ItemSaleDetailID = @ItemSaleDetailID
	END

	IF (isnull(@Result, '') = '')
		SET @Result = (
				SELECT TOP 1 AccountSortName
				FROM Accounts
				WHERE AccountID = (
						SELECT TOP 1 CompanyAccountID
						FROM Configurations
						)
				)

	RETURN @Result
END
