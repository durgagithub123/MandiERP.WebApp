Create PROCEDURE [dbo].[UserLoginMaster_Get] 
AS
Select 
[UserID],
[RoleID],
[FirstName],
[Middleame],
[LastName],
[UserName],
[IsAdmin],
[Password],
[RoleName],
[LoginDate],
[Logout],
[LoginMessage]

from 
UserLoginMaster
Return
