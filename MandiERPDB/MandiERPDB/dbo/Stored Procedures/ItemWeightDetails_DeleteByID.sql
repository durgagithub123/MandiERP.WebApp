
Create PROCEDURE [dbo].[ItemWeightDetails_DeleteByID] 
	(
@ItemWeightDetailID int
)
AS
Delete  from 
ItemWeightDetails 
where 
[ItemWeightDetailID]=@ItemWeightDetailID


Return
