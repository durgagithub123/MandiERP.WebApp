
CREATE PROCEDURE [dbo].[AccountTransactionBalances_UpdateByID] 
	(
@AccountTransactionBalanceID bigint,
@AccountTransactionLedgerNo bigint=null,
@fkAccountID bigint=null,
@Credit float=null,
@Debit float=null,
@Ledger float=null,
@LastUpdated datetime=null,
@Sysdate datetime=null
)
AS
Update  AccountTransactionBalances Set 
[AccountTransactionLedgerNo]=@AccountTransactionLedgerNo,
[fkAccountID]=@fkAccountID,
[Credit]=@Credit,
[Debit]=@Debit,
[Ledger]=@Ledger,
[LastUpdated]=@LastUpdated,
[Sysdate]=@Sysdate
 
where 
[AccountTransactionBalanceID]=@AccountTransactionBalanceID


Return
