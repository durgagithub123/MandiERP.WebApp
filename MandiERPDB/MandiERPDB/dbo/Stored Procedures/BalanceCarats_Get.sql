Create PROCEDURE [dbo].[BalanceCarats_Get] 
AS
Select 
[BalanceCaratID],
[BalanceCaratNo],
[fkAccountID],
[IsCompanyAccount],
[LedgerCarat],
[TransactionDate],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

from 
BalanceCarats
Return
