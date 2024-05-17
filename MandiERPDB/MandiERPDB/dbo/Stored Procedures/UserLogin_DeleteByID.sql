
Create PROCEDURE [dbo].[UserLogin_DeleteByID] 
	(
@UserLoginID bigint
)
AS
Delete  from 
UserLogin 
where 
[UserLoginID]=@UserLoginID


Return
