
Create PROCEDURE [dbo].[CashBookDailyBalances_DeleteByID] 
	(
@CashBookDailyBalanceID bigint
)
AS
Delete  from 
CashBookDailyBalances 
where 
[CashBookDailyBalanceID]=@CashBookDailyBalanceID


Return
