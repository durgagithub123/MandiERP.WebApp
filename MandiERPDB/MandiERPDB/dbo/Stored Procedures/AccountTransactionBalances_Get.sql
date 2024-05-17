Create PROCEDURE [dbo].[AccountTransactionBalances_Get] 
AS
Select 
[AccountTransactionBalanceID],
[AccountTransactionLedgerNo],
[fkAccountID],
[Credit],
[Debit],
[Ledger],
[LastUpdated],
[Sysdate]

from 
AccountTransactionBalances
Return
