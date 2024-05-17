
CREATE PROCEDURE [dbo].[UserInRoles_GetByID] 
	(
@UserInRoleID int
)
AS
SELECT	 
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

FROM 
UserInRoles  
WHERE 
[UserInRoleID]=@UserInRoleID


RETURN
