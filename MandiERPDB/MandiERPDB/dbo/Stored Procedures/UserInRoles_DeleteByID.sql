
Create PROCEDURE [dbo].[UserInRoles_DeleteByID] 
	(
@UserInRoleID int
)
AS
Delete  from 
UserInRoles 
where 
[UserInRoleID]=@UserInRoleID


Return
