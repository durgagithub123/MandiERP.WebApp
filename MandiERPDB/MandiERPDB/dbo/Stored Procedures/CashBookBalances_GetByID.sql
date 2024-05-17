
CREATE PROCEDURE [dbo].[CashBookBalances_GetByID] 
	(
@CashBookBalanceID bigint
)
AS
SELECT	 
[CashBookBalanceID],
[CashBookBalanceNo],
[CashBookBalanceCode],
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
CashBookBalances  
WHERE 
[CashBookBalanceID]=@CashBookBalanceID


RETURN
