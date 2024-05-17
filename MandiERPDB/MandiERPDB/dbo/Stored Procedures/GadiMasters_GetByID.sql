
CREATE PROCEDURE [dbo].[GadiMasters_GetByID] 
	(
@GadiMasterID int
)
AS
SELECT	 
[GadiMasterID],
[GadiMasterNo],
[GadiNo],
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
GadiMasters  
WHERE 
[GadiMasterID]=@GadiMasterID


RETURN
