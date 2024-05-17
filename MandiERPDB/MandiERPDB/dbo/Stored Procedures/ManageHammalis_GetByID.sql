
CREATE PROCEDURE [dbo].[ManageHammalis_GetByID] 
	(
@ManageHammaliID bigint
)
AS
SELECT	 
[ManageHammaliID],
[ManageHammaliNo],
[ManageHammaliCode],
[ManageHammaliDetail],
[fkAccountID],
[IsCompanyAccount],
[fkBillID],
[fkExportID],
[TransactionDate],
[TransactionDetail],
[DebitHammali],
[CreditHammali],
[IsDebitOrCredit],
[BalanceHammali],
[RecieptType],
[Remark],
[Comment],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

FROM 
ManageHammalis  
WHERE 
[ManageHammaliID]=@ManageHammaliID


RETURN
