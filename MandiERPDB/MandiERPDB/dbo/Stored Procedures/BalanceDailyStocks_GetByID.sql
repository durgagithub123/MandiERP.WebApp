
CREATE PROCEDURE [dbo].[BalanceDailyStocks_GetByID] 
	(
@BalanceDailyStockID bigint
)
AS
SELECT	 
[BalanceDailyStockID],
[BalanceDailyStockNo],
[BalanceDailyStockCode],
[fkAccountID],
[IsCompanyAccount],
[LedgerStock],
[TransactionDate],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

FROM 
BalanceDailyStocks  
WHERE 
[BalanceDailyStockID]=@BalanceDailyStockID


RETURN
