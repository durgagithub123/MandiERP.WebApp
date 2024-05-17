
Create PROCEDURE [dbo].[CashBookBalances_DeleteByID] 
	(
@CashBookBalanceID bigint
)
AS
Delete  from 
CashBookBalances 
where 
[CashBookBalanceID]=@CashBookBalanceID


Return
