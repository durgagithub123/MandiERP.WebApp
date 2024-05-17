
Create PROCEDURE [dbo].[BalanceDailyStocks_DeleteByID] 
	(
@BalanceDailyStockID bigint
)
AS
Delete  from 
BalanceDailyStocks 
where 
[BalanceDailyStockID]=@BalanceDailyStockID


Return
