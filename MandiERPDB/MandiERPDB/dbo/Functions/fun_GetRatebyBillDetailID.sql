CREATE FUNCTION [dbo].[fun_GetRatebyBillDetailID] (@BillDetailID INT)
RETURNS VARCHAR(200)
AS
BEGIN
	DECLARE @Result VARCHAR(200)
	DECLARE @ColumnValue VARCHAR(200)
	DECLARE @Count INT

	SET @count = (
			SELECT count(1)
			FROM itemsaledetails
			WHERE fkBillDetailID = @BillDetailID
			and isActive != '0'
			)

	-- select Quantity,    
	--Rate ,fkBillDetailID from itemsaledetails     
	IF (@count = 1)
	BEGIN
		SET @ColumnValue = (
				SELECT convert(VARCHAR(50), Rate)
				FROM itemsaledetails
				WHERE fkBillDetailID = @BillDetailID
				and IsActive != '0'
				)
	END
	ELSE
	BEGIN
		SELECT @ColumnValue = COALESCE(@ColumnValue + ',', '') + Convert(VARCHAR(10), Quantity) + '-' + convert(VARCHAR(50), Rate)
		FROM itemsaledetails
		WHERE fkBillDetailID = @BillDetailID
				and IsActive != '0'
		ORDER BY CreateDate ASC
	END

	SET @Result = @ColumnValue

	RETURN @Result
END
