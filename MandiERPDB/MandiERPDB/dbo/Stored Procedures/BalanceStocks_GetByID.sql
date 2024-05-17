
CREATE PROCEDURE [dbo].[BalanceStocks_GetByID] 
	(
@BalanceStockID bigint
)
AS
SELECT	 
[BalanceStockID],
[BalanceStockNo],
[BalanceStockCode],
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
BalanceStocks  
WHERE 
[BalanceStockID]=@BalanceStockID


RETURN
