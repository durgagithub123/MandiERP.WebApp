
Create PROCEDURE [dbo].[Roles_DeleteByID] 
	(
@RoleID int
)
AS
Delete  from 
Roles 
where 
[RoleID]=@RoleID


Return
