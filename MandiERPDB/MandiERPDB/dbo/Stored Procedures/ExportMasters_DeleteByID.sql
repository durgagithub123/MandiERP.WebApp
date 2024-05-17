
Create PROCEDURE [dbo].[ExportMasters_DeleteByID] 
	(
@ExportMasterID int
)
AS
Delete  from 
ExportMasters 
where 
[ExportMasterID]=@ExportMasterID


Return
