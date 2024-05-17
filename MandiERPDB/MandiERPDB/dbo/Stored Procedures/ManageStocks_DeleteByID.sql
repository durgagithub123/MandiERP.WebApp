
Create PROCEDURE [dbo].[ManageStocks_DeleteByID] 
	(
@ManageStockID bigint
)
AS
Delete  from 
ManageStocks 
where 
[ManageStockID]=@ManageStockID


Return
