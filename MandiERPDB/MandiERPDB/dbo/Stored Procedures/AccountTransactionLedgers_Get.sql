Create PROCEDURE [dbo].[AccountTransactionLedgers_Get] 
AS
Select 
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

from 
AccountTransactionLedgers
Return
