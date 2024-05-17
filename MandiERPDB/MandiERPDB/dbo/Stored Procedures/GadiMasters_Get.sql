Create PROCEDURE [dbo].[GadiMasters_Get] 
AS
Select 
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

from 
GadiMasters
Return
