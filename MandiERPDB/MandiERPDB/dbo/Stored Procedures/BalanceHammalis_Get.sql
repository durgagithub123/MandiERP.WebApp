Create PROCEDURE [dbo].[BalanceHammalis_Get] 
AS
Select 
[BalanceHammaliID],
[BalanceHammaliNo],
[BalanceHammaliCode],
[fkAccountID],
[IsCompanyAccount],
[LedgerHammali],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

from 
BalanceHammalis
Return
