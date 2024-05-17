
Create PROCEDURE [dbo].[BalanceStocks_DeleteByID] 
	(
@BalanceStockID bigint
)
AS
Delete  from 
BalanceStocks 
where 
[BalanceStockID]=@BalanceStockID


Return
