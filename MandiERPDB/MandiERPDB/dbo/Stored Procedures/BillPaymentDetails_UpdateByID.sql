
CREATE PROCEDURE [dbo].[BillPaymentDetails_UpdateByID] 
	(
@BillPaymentDeatilID int,
@fkBillID int=null,
@CompanyBankAccountID int=null,
@PaymentMode varchar(250)=null,
@CashAmount decimal=null,
@fkAccountBankDetailID int=null,
@ChequeDate datetime=null,
@ChequeNo varchar(250)=null,
@ChequeAmount decimal=null,
@BankAccountNo varchar(100)=null,
@BranchNo varchar(50)=null,
@BranchName varchar(50)=null,
@IfscCode varchar(50)=null,
@PanNo varchar(50)=null,
@AccountHolderName varchar(50)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@TransactionNo varchar(250)=null,
@Remark varchar(250)=null,
@Sysdate datetime=null
)
AS
Update  BillPaymentDetails Set 
[fkBillID]=@fkBillID,
[CompanyBankAccountID]=@CompanyBankAccountID,
[PaymentMode]=@PaymentMode,
[CashAmount]=@CashAmount,
[fkAccountBankDetailID]=@fkAccountBankDetailID,
[ChequeDate]=@ChequeDate,
[ChequeNo]=@ChequeNo,
[ChequeAmount]=@ChequeAmount,
[BankAccountNo]=@BankAccountNo,
[BranchNo]=@BranchNo,
[BranchName]=@BranchName,
[IfscCode]=@IfscCode,
[PanNo]=@PanNo,
[AccountHolderName]=@AccountHolderName,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[TransactionNo]=@TransactionNo,
[Remark]=@Remark,
[Sysdate]=@Sysdate
 
where 
[BillPaymentDeatilID]=@BillPaymentDeatilID


Return
