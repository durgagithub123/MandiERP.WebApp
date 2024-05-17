
Create PROCEDURE [dbo].[ManageAccounts_DeleteByID] 
	(
@ManageAccountID bigint
)
AS
Delete  from 
ManageAccounts 
where 
[ManageAccountID]=@ManageAccountID


Return
