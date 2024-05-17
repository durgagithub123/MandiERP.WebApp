
CREATE PROCEDURE [dbo].[BillPayments_Insert] 
	(
@BillPaymentNo bigint=null,
@BillPaymentCode varchar(100)=null,
@fkBillID bigint=null,
@SNo int=null,
@PaidAmount decimal=null,
@PaidDate datetime=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null,
@fkBankAccountID int=null,
@fkAccountBankDetailID int=null,
@Remark varchar(500)=null
)
AS
Insert Into 
BillPayments 
(
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
) 
values(
@BillPaymentNo,
@BillPaymentCode,
@fkBillID,
@SNo,
@PaidAmount,
@PaidDate,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate,
@fkBankAccountID,
@fkAccountBankDetailID,
@Remark
)
RETURN Scope_identity()
