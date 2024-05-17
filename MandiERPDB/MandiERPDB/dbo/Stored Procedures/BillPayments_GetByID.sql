
CREATE PROCEDURE [dbo].[BillPayments_GetByID] 
	(
@BillPaymentID bigint
)
AS
SELECT	 
[BillPaymentID],
[BillPaymentNo],
[BillPaymentCode],
[fkBillID],
[SNo],
[PaidAmount],
[PaidDate],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate],
[fkBankAccountID],
[fkAccountBankDetailID],
[Remark]

FROM 
BillPayments  
WHERE 
[BillPaymentID]=@BillPaymentID


RETURN
