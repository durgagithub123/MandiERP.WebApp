Create PROCEDURE [dbo].[GadiDriverMasters_Get] 
AS
Select 
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

from 
GadiDriverMasters
Return
