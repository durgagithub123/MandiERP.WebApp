
Create PROCEDURE [dbo].[Accounts_DeleteByID] 
	(
@AccountID bigint
)
AS
Delete  from 
Accounts 
where 
[AccountID]=@AccountID


Return
