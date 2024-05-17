
CREATE PROCEDURE [dbo].[AccountTransactionBalances_GetByID] 
	(
@AccountTransactionBalanceID bigint
)
AS
SELECT	 
[AccountTransactionBalanceID],
[AccountTransactionLedgerNo],
[fkAccountID],
[Credit],
[Debit],
[Ledger],
[LastUpdated],
[Sysdate]

FROM 
AccountTransactionBalances  
WHERE 
[AccountTransactionBalanceID]=@AccountTransactionBalanceID


RETURN
