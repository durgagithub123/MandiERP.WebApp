
Create PROCEDURE [dbo].[AccountTransactionLedgers_DeleteByID] 
	(
@AccountTransactionLedgerID bigint
)
AS
Delete  from 
AccountTransactionLedgers 
where 
[AccountTransactionLedgerID]=@AccountTransactionLedgerID


Return
