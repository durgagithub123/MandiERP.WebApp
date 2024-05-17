Create PROCEDURE [dbo].[UserInRoles_Get] 
AS
Select 
[UserInRoleID],
[UserInRoleNo],
[fkUserID],
[fkRoleID],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

from 
UserInRoles
Return
