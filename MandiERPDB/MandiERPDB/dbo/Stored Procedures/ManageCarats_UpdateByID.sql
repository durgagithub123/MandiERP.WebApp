
CREATE PROCEDURE [dbo].[ManageCarats_UpdateByID] 
	(
@ManageCaratID bigint,
@ManageCaratNo bigint=null,
@ManageCaratCode varchar(100)=null,
@ManageCaratDetail varchar(100)=null,
@fkAccountID bigint=null,
@IsCompanyAccount varchar(50)=null,
@fkBillID int=null,
@fkExportID int=null,
@TransactionDate datetime=null,
@TransactionDetail varchar(250)=null,
@DebitCarat decimal=null,
@CreditCarat decimal=null,
@IsDebitOrCredit nvarchar(50)=null,
@BalanceCarat int=null,
@RecieptType varchar(20)=null,
@Remark varchar(200)=null,
@Comment varchar(200)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@Sysdate datetime=null
)
AS
Update  ManageCarats Set 
[ManageCaratNo]=@ManageCaratNo,
[ManageCaratCode]=@ManageCaratCode,
[ManageCaratDetail]=@ManageCaratDetail,
[fkAccountID]=@fkAccountID,
[IsCompanyAccount]=@IsCompanyAccount,
[fkBillID]=@fkBillID,
[fkExportID]=@fkExportID,
[TransactionDate]=@TransactionDate,
[TransactionDetail]=@TransactionDetail,
[DebitCarat]=@DebitCarat,
[CreditCarat]=@CreditCarat,
[IsDebitOrCredit]=@IsDebitOrCredit,
[BalanceCarat]=@BalanceCarat,
[RecieptType]=@RecieptType,
[Remark]=@Remark,
[Comment]=@Comment,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[ManageCaratID]=@ManageCaratID


Return
