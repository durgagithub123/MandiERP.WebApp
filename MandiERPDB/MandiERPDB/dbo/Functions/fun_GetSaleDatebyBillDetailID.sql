CREATE FUNCTION [dbo].[fun_GetSaleDatebyBillDetailID] (@BillDetailID INT)
RETURNS VARCHAR(200)
AS
BEGIN
	DECLARE @Result VARCHAR(200)
	DECLARE @ColumnValue VARCHAR(200)
	DECLARE @Count INT;

	WITH CTE
	AS (
		SELECT DISTINCT CONVERT(VARCHAR(10), CreateDate, 112) AS dateCount
		FROM itemsaledetails
		WHERE fkBillDetailID = @BillDetailID
			and isActive != '0'
		)
	SELECT @count = count(1)
	FROM CTE

	-- select Quantity,    
	--Rate ,fkBillDetailID from itemsaledetails     
	IF (@count = 1)
	BEGIN
		SET @ColumnValue = (
				SELECT TOP 1 convert(VARCHAR(5), CreateDate, 103)
				FROM itemsaledetails
				WHERE fkBillDetailID = @BillDetailID
				and isActive != '0'
				)
	END
	ELSE
	BEGIN
		SELECT @ColumnValue = COALESCE(@ColumnValue + ',', '') + Convert(VARCHAR(10), Quantity) + '-' + convert(VARCHAR(5), CreateDate, 103)
		FROM itemsaledetails
		WHERE fkBillDetailID = @BillDetailID
			and isActive != '0'
		ORDER BY CreateDate ASC
	END

	SET @Result = @ColumnValue

	RETURN @Result
END
