
Create PROCEDURE [dbo].[AccountTransactions_DeleteByID] 
	(
@AccountTransactionID bigint
)
AS
Delete  from 
AccountTransactions 
where 
[AccountTransactionID]=@AccountTransactionID


Return
