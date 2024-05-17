
Create PROCEDURE [dbo].[GadiDriverMasters_DeleteByID] 
	(
@GadiDriverMasterID int
)
AS
Delete  from 
GadiDriverMasters 
where 
[GadiDriverMasterID]=@GadiDriverMasterID


Return
