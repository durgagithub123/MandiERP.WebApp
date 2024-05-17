Create PROCEDURE [dbo].[Roles_Get] 
AS
Select 
[RoleID],
[RoleNo],
[RoleName],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

from 
Roles
Return
