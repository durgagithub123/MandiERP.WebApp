
CREATE PROCEDURE [dbo].[CashBookDailyBalances_GetByID] 
	(
@CashBookDailyBalanceID bigint
)
AS
SELECT	 
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

FROM 
CashBookDailyBalances  
WHERE 
[CashBookDailyBalanceID]=@CashBookDailyBalanceID


RETURN
