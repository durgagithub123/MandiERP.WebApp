
CREATE PROCEDURE [dbo].[ManageCarats_GetByID] 
	(
@ManageCaratID bigint
)
AS
SELECT	 
[ManageCaratID],
[ManageCaratNo],
[ManageCaratCode],
[ManageCaratDetail],
[fkAccountID],
[IsCompanyAccount],
[fkBillID],
[fkExportID],
[TransactionDate],
[TransactionDetail],
[DebitCarat],
[CreditCarat],
[IsDebitOrCredit],
[BalanceCarat],
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
ManageCarats  
WHERE 
[ManageCaratID]=@ManageCaratID


RETURN
