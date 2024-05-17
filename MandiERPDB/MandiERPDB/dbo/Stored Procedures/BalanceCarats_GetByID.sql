
CREATE PROCEDURE [dbo].[BalanceCarats_GetByID] 
	(
@BalanceCaratID bigint
)
AS
SELECT	 
[BalanceCaratID],
[BalanceCaratNo],
[fkAccountID],
[IsCompanyAccount],
[LedgerCarat],
[TransactionDate],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

FROM 
BalanceCarats  
WHERE 
[BalanceCaratID]=@BalanceCaratID


RETURN
