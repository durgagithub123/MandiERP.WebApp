Create PROCEDURE [dbo].[CashBookDailyBalances_Get] 
AS
Select 
[CashBookDailyBalanceID],
[CashBookDailyBalanceNo],
[CashBookDailyBalanceCode],
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
CashBookDailyBalances
Return
