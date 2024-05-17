
CREATE PROCEDURE [dbo].[ManageHammalis_UpdateByID] 
	(
@ManageHammaliID bigint,
@ManageHammaliNo bigint=null,
@ManageHammaliCode varchar(100)=null,
@ManageHammaliDetail varchar(100)=null,
@fkAccountID bigint=null,
@IsCompanyAccount varchar(50)=null,
@fkBillID int=null,
@fkExportID int=null,
@TransactionDate datetime=null,
@TransactionDetail varchar(250)=null,
@DebitHammali decimal=null,
@CreditHammali decimal=null,
@IsDebitOrCredit nvarchar(50)=null,
@BalanceHammali decimal=null,
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
Update  ManageHammalis Set 
[ManageHammaliNo]=@ManageHammaliNo,
[ManageHammaliCode]=@ManageHammaliCode,
[ManageHammaliDetail]=@ManageHammaliDetail,
[fkAccountID]=@fkAccountID,
[IsCompanyAccount]=@IsCompanyAccount,
[fkBillID]=@fkBillID,
[fkExportID]=@fkExportID,
[TransactionDate]=@TransactionDate,
[TransactionDetail]=@TransactionDetail,
[DebitHammali]=@DebitHammali,
[CreditHammali]=@CreditHammali,
[IsDebitOrCredit]=@IsDebitOrCredit,
[BalanceHammali]=@BalanceHammali,
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
[ManageHammaliID]=@ManageHammaliID


Return
