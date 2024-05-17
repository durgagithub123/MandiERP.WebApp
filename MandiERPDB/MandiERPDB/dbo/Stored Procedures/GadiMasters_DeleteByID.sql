
Create PROCEDURE [dbo].[GadiMasters_DeleteByID] 
	(
@GadiMasterID int
)
AS
Delete  from 
GadiMasters 
where 
[GadiMasterID]=@GadiMasterID


Return
