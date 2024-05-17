
Create PROCEDURE [dbo].[UserDetails_DeleteByID] 
	(
@UserDetailID int
)
AS
Delete  from 
UserDetails 
where 
[UserDetailID]=@UserDetailID


Return
