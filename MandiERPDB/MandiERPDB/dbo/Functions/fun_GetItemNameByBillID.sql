Create FUNCTION [dbo].[fun_GetItemNameByBillID] 
(
	-- Add the parameters for the function here
	@BillID bigInt
)
RETURNS Varchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result Varchar(100)

	-- Add the T-SQL statements to compute the return value here
	--SELECT @Result = @BillID
	
	select  @Result =   COALESCE(@Result + ',', '') + CAST(ItemName AS VARCHAR)
		FROM   BillDetails
		WHERE  fkBillID = @BillID
		GROUP BY ItemName 

	-- Return the result of the function
	RETURN @Result

END