
CREATE PROCEDURE [dbo].[AccountTransactionBalances_Insert] 
	(
@AccountTransactionLedgerNo bigint=null,
@fkAccountID bigint=null,
@Credit float=null,
@Debit float=null,
@Ledger float=null,
@LastUpdated datetime=null,
@Sysdate datetime=null
)
AS
Insert Into 
AccountTransactionBalances 
(
[AccountTransactionLedgerNo],
[fkAccountID],
[Credit],
[Debit],
[Ledger],
[LastUpdated],
[Sysdate]
) 
values(
@AccountTransactionLedgerNo,
@fkAccountID,
@Credit,
@Debit,
@Ledger,
@LastUpdated,
@Sysdate
)
RETURN Scope_identity()
