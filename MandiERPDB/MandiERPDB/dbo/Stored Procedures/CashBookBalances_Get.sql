Create PROCEDURE [dbo].[CashBookBalances_Get] 
AS
Select 
[CashBookBalanceID],
[CashBookBalanceNo],
[CashBookBalanceCode],
[IsCompanyAccount],
[fkAccountID],
[fkAccountType],
[BalanceAmount],
[TransactionDate],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

from 
CashBookBalances
Return
