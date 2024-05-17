
Create PROCEDURE [dbo].[ManageHammalis_DeleteByID] 
	(
@ManageHammaliID bigint
)
AS
Delete  from 
ManageHammalis 
where 
[ManageHammaliID]=@ManageHammaliID


Return
