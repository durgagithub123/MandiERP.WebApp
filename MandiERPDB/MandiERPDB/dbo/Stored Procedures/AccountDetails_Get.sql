Create PROCEDURE [dbo].[AccountDetails_Get] 
AS
Select 
[AccountDetailID],
[AccountDetailNo],
[fkAccountID],
[Name],
[NameHindi],
[MobileNo],
[PhoneNo],
[Address1],
[Address2],
[City],
[State],
[Zip],
[Country],
[PanNo],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

from 
AccountDetails
Return
