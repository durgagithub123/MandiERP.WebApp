
Create PROCEDURE [dbo].[AccountTransactionBalances_DeleteByID] 
	(
@AccountTransactionBalanceID bigint
)
AS
Delete  from 
AccountTransactionBalances 
where 
[AccountTransactionBalanceID]=@AccountTransactionBalanceID


Return
