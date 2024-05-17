
CREATE PROCEDURE [dbo].[AccountTransactionLedgers_GetByID] 
	(
@AccountTransactionLedgerID bigint
)
AS
SELECT	 
[AccountTransactionLedgerID],
[AccountTransactionLedgerNo],
[fkAccountID],
[IsCompanyAccount],
[LedgerBalance],
[TransactionDate],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

FROM 
AccountTransactionLedgers  
WHERE 
[AccountTransactionLedgerID]=@AccountTransactionLedgerID


RETURN
