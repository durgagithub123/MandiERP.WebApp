﻿
CREATE PROCEDURE [dbo].[AccountTransactions_UpdateByID] 
	(
@AccountTransactionID bigint,
@AccountTransactionNo bigint=null,
@AccountTransactionCode varchar(50)=null,
@AccountTransactionDetail varchar(50)=null,
@VoucherNo bigint=null,
@VoucherType varchar(50)=null,
@CashorBankAccount varchar(50)=null,
@ChequeNo varchar(50)=null,
@RecieptType varchar(20)=null,
@fkAccountID bigint,
@fkAccountType int=null,
@fkVillageID int=null,
@VillageName varchar(50)=null,
@IsCompanyAccount varchar(50)=null,
@AccountHolder nvarchar(500)=null,
@fkBillID int=null,
@fkBillDetailID int=null,
@fkExportMasterID int=null,
@fkExportItemDetailID int=null,
@TransactionDate datetime=null,
@TransactionDetail nvarchar(500)=null,
@Folio nvarchar(500)=null,
@DebitAmount decimal=null,
@CreditAmount decimal=null,
@IsDebitOrCredit nvarchar(50)=null,
@BalanceAmount decimal=null,
@Remark varchar(200)=null,
@Comment varchar(200)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@fkCashBookID int=null,
@fkItemSaleDetailID bigint=null,
@PanaFlag char(1)=null,
@PanaActualAmount float=null,
@PanaAspectedAmount float=null,
@PanaPaidAmount float=null,
@PanaDiscount float=null,
@PanaPercent int=null,
@PanaSystemPercent int=null,
@IsExport bit=null,
@IsPurchase bit=null,
@IsSale bit=null,
@RemarkItemSale float=null,
@PurchaseAmount float=null,
@SaleAmount float=null,
@RateDiffAmount float=null,
@Sysdate datetime=null,
@fkBillPaymentID int=null
)
AS
Update  AccountTransactions Set 
[AccountTransactionNo]=@AccountTransactionNo,
[AccountTransactionCode]=@AccountTransactionCode,
[AccountTransactionDetail]=@AccountTransactionDetail,
[VoucherNo]=@VoucherNo,
[VoucherType]=@VoucherType,
[CashorBankAccount]=@CashorBankAccount,
[ChequeNo]=@ChequeNo,
[RecieptType]=@RecieptType,
[fkAccountID]=@fkAccountID,
[fkAccountType]=@fkAccountType,
[fkVillageID]=@fkVillageID,
[VillageName]=@VillageName,
[IsCompanyAccount]=@IsCompanyAccount,
[AccountHolder]=@AccountHolder,
[fkBillID]=@fkBillID,
[fkBillDetailID]=@fkBillDetailID,
[fkExportMasterID]=@fkExportMasterID,
[fkExportItemDetailID]=@fkExportItemDetailID,
[TransactionDate]=@TransactionDate,
[TransactionDetail]=@TransactionDetail,
[Folio]=@Folio,
[DebitAmount]=@DebitAmount,
[CreditAmount]=@CreditAmount,
[IsDebitOrCredit]=@IsDebitOrCredit,
[BalanceAmount]=@BalanceAmount,
[Remark]=@Remark,
[Comment]=@Comment,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[fkCashBookID]=@fkCashBookID,
[fkItemSaleDetailID]=@fkItemSaleDetailID,
[PanaFlag]=@PanaFlag,
[PanaActualAmount]=@PanaActualAmount,
[PanaAspectedAmount]=@PanaAspectedAmount,
[PanaPaidAmount]=@PanaPaidAmount,
[PanaDiscount]=@PanaDiscount,
[PanaPercent]=@PanaPercent,
[PanaSystemPercent]=@PanaSystemPercent,
[IsExport]=@IsExport,
[IsPurchase]=@IsPurchase,
[IsSale]=@IsSale,
[RemarkItemSale]=@RemarkItemSale,
[PurchaseAmount]=@PurchaseAmount,
[SaleAmount]=@SaleAmount,
[RateDiffAmount]=@RateDiffAmount,
[Sysdate]=@Sysdate,
[fkBillPaymentID]=@fkBillPaymentID
 
where 
[AccountTransactionID]=@AccountTransactionID


Return
