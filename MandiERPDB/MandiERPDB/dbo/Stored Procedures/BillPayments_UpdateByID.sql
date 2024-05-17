
CREATE PROCEDURE [dbo].[BillPayments_UpdateByID] 
	(
@BillPaymentID bigint,
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
Update  BillPayments Set 
[BillPaymentNo]=@BillPaymentNo,
[BillPaymentCode]=@BillPaymentCode,
[fkBillID]=@fkBillID,
[SNo]=@SNo,
[PaidAmount]=@PaidAmount,
[PaidDate]=@PaidDate,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate,
[fkBankAccountID]=@fkBankAccountID,
[fkAccountBankDetailID]=@fkAccountBankDetailID,
[Remark]=@Remark
 
where 
[BillPaymentID]=@BillPaymentID


Return
