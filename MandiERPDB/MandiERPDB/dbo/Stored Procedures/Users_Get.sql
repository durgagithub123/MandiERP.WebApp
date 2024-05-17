Create PROCEDURE [dbo].[Users_Get] 
AS
Select 
[UserID],
[UserNo],
[UserName],
[IsAdmin],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

from 
Users
Return
