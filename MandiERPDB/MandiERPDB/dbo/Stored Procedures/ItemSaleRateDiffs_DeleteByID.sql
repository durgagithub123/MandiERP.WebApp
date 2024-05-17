
Create PROCEDURE [dbo].[ItemSaleRateDiffs_DeleteByID] 
	(
@ItemSaleRateDiffID bigint
)
AS
Delete  from 
ItemSaleRateDiffs 
where 
[ItemSaleRateDiffID]=@ItemSaleRateDiffID


Return
