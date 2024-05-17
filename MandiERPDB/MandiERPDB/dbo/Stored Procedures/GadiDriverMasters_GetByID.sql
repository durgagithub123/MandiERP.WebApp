
CREATE PROCEDURE [dbo].[GadiDriverMasters_GetByID] 
	(
@GadiDriverMasterID int
)
AS
SELECT	 
[GadiDriverMasterID],
[GadiDriverMasterNo],
[fkGadiMasterID],
[DriverName],
[DriverNameHindi],
[Address],
[City],
[State],
[Country],
[PinCode],
[MobileNo],
[PhoneNo],
[EmailID],
[FaxNo],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
GadiDriverMasters  
WHERE 
[GadiDriverMasterID]=@GadiDriverMasterID


RETURN
