
CREATE PROCEDURE [dbo].[ManageStocks_GetByID] 
	(
@ManageStockID bigint
)
AS
SELECT	 
[ManageStockID],
[ManageStockNo],
[ManageStockCode],
[ManageStockDetail],
[fkAccountID],
[IsCompanyAccount],
[fkRefAccountID],
[fkBillDetailID],
[fkExportDetailID],
[fkItemTypeID],
[TransactionDate],
[TransactionDetail],
[DebitStock],
[CreditStock],
[IsDebitOrCredit],
[BalanceStock],
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
ManageStocks  
WHERE 
[ManageStockID]=@ManageStockID


RETURN
