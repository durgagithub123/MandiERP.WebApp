
Create PROCEDURE [dbo].[Villages_DeleteByID] 
	(
@VillageID bigint
)
AS
Delete  from 
Villages 
where 
[VillageID]=@VillageID


Return
