
Create PROCEDURE [dbo].[ExportItemDetails_DeleteByID] 
	(
@ExportItemDetailID int
)
AS
Delete  from 
ExportItemDetails 
where 
[ExportItemDetailID]=@ExportItemDetailID


Return
