Create PROCEDURE [dbo].[UserLogin_Get] 
AS
Select 
[UserLoginID],
[UserLoginNo],
[fkUserID],
[LoginDate],
[Logout],
[LoginMessage],
[fkBranchID],
[IsActive],
[CreateDate],
[ModifyDate],
[Sysdate]

from 
UserLogin
Return
