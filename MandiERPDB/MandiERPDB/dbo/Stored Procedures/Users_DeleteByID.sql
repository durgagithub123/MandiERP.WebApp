
Create PROCEDURE [dbo].[Users_DeleteByID] 
	(
@UserID int
)
AS
Delete  from 
Users 
where 
[UserID]=@UserID


Return
