
CREATE PROCEDURE [dbo].[BalanceHammalis_GetByID] 
	(
@BalanceHammaliID bigint
)
AS
SELECT	 
[BalanceHammaliID],
[BalanceHammaliNo],
[BalanceHammaliCode],
[fkAccountID],
[IsCompanyAccount],
[LedgerHammali],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

FROM 
BalanceHammalis  
WHERE 
[BalanceHammaliID]=@BalanceHammaliID


RETURN
