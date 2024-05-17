CREATE FUNCTION [dbo].[fun_GetItemNameByExportMasterID] 
(
	-- Add the parameters for the function here
	@ExportMasterID bigInt
)
RETURNS Varchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result Varchar(100)

	-- Add the T-SQL statements to compute the return value here
	--SELECT @Result = @BillID
	
	select  @Result =   COALESCE(@Result + ',', '') + CAST(ItemName AS VARCHAR)
		FROM   ExportItemDetails
		WHERE  fkExportMasterID = @ExportMasterID
		GROUP BY ItemName 

	-- Return the result of the function
	RETURN isnull(@Result,'')

END