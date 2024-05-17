
CREATE PROCEDURE [dbo].[BillPaymentDetails_GetByID] 
	(
@BillPaymentDeatilID int
)
AS
SELECT	 
[BillPaymentDeatilID],
[fkBillID],
[CompanyBankAccountID],
[PaymentMode],
[CashAmount],
[fkAccountBankDetailID],
[ChequeDate],
[ChequeNo],
[ChequeAmount],
[BankAccountNo],
[BranchNo],
[BranchName],
[IfscCode],
[PanNo],
[AccountHolderName],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[TransactionNo],
[Remark],
[Sysdate]

FROM 
BillPaymentDetails  
WHERE 
[BillPaymentDeatilID]=@BillPaymentDeatilID


RETURN
