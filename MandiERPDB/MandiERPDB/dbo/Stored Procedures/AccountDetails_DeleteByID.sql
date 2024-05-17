
Create PROCEDURE [dbo].[AccountDetails_DeleteByID] 
	(
@AccountDetailID bigint
)
AS
Delete  from 
AccountDetails 
where 
[AccountDetailID]=@AccountDetailID


Return
