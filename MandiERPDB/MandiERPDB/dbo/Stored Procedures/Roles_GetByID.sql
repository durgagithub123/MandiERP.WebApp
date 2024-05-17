
CREATE PROCEDURE [dbo].[Roles_GetByID] 
	(
@RoleID int
)
AS
SELECT	 
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

FROM 
Roles  
WHERE 
[RoleID]=@RoleID


RETURN
