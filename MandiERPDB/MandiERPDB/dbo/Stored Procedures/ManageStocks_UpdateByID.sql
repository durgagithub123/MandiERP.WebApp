
CREATE PROCEDURE [dbo].[ManageStocks_UpdateByID] 
	(
@ManageStockID bigint,
@ManageStockNo bigint=null,
@ManageStockCode varchar(100)=null,
@ManageStockDetail varchar(100)=null,
@fkAccountID bigint=null,
@IsCompanyAccount varchar(50)=null,
@fkRefAccountID bigint=null,
@fkBillDetailID bigint=null,
@fkExportDetailID bigint=null,
@fkItemTypeID int=null,
@TransactionDate datetime=null,
@TransactionDetail varchar(250)=null,
@DebitStock bigint=null,
@CreditStock bigint=null,
@IsDebitOrCredit nvarchar(50)=null,
@BalanceStock bigint=null,
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
Update  ManageStocks Set 
[ManageStockNo]=@ManageStockNo,
[ManageStockCode]=@ManageStockCode,
[ManageStockDetail]=@ManageStockDetail,
[fkAccountID]=@fkAccountID,
[IsCompanyAccount]=@IsCompanyAccount,
[fkRefAccountID]=@fkRefAccountID,
[fkBillDetailID]=@fkBillDetailID,
[fkExportDetailID]=@fkExportDetailID,
[fkItemTypeID]=@fkItemTypeID,
[TransactionDate]=@TransactionDate,
[TransactionDetail]=@TransactionDetail,
[DebitStock]=@DebitStock,
[CreditStock]=@CreditStock,
[IsDebitOrCredit]=@IsDebitOrCredit,
[BalanceStock]=@BalanceStock,
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
[ManageStockID]=@ManageStockID


Return
