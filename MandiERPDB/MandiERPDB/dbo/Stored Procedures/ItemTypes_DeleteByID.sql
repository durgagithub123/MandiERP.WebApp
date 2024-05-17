
Create PROCEDURE [dbo].[ItemTypes_DeleteByID] 
	(
@ItemTypeID int
)
AS
Delete  from 
ItemTypes 
where 
[ItemTypeID]=@ItemTypeID


Return
