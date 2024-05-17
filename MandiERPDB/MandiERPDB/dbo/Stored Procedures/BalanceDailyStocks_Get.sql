Create PROCEDURE [dbo].[BalanceDailyStocks_Get] 
AS
Select 
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

from 
BalanceDailyStocks
Return
