-- =============================================
-- Author:		<Arun Patidar>
-- Create date: <06 Feb 2015>
-- Description:	<get total export quantity>
-- =============================================
CREATE FUNCTION [dbo].[fun_GetExportQuantityCount]
(
	-- Add the parameters for the function here
	@ItemSaleDetailID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	select @result=sum(isnull(AcutualQuantity,0)) from dbo.ExportItemDetails
	where fkItemSaleDetailID=@ItemSaleDetailID

	-- Return the result of the function
	RETURN isnull(@result,0)

END
