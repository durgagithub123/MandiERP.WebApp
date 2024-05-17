
Create PROCEDURE [dbo].[UserAccounts_DeleteByID] 
	(
@UserAccountID int
)
AS
Delete  from 
UserAccounts 
where 
[UserAccountID]=@UserAccountID


Return
