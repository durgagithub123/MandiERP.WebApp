Create PROCEDURE [dbo].[BillPayments_Get] 
AS
Select 
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

from 
BillPayments
Return
