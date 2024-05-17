Create PROCEDURE [dbo].[UserDetails_Get] 
AS
Select 
[UserDetailID],
[UserDetailNo],
[fkUserID],
[FirstName],
[Middleame],
[LastName],
[PhoneNo],
[MobileNo],
[City],
[State],
[Zip],
[Address],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

from 
UserDetails
Return
