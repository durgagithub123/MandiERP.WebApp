
Create PROCEDURE [dbo].[ItemUnits_DeleteByID] 
	(
@ItemUnitID int
)
AS
Delete  from 
ItemUnits 
where 
[ItemUnitID]=@ItemUnitID


Return
