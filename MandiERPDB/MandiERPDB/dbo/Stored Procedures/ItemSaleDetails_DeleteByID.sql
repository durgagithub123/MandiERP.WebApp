
Create PROCEDURE [dbo].[ItemSaleDetails_DeleteByID] 
	(
@ItemSaleDetailID bigint
)
AS
Delete  from 
ItemSaleDetails 
where 
[ItemSaleDetailID]=@ItemSaleDetailID


Return
