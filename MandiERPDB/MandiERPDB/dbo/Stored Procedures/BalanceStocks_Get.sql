Create PROCEDURE [dbo].[BalanceStocks_Get] 
AS
Select 
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

from 
BalanceStocks
Return
