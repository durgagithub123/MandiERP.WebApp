﻿
CREATE PROCEDURE [dbo].[AccountTransactions_Insert] 
	(
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
Insert Into 
AccountTransactions 
(
[AccountTransactionNo],
[AccountTransactionCode],
[AccountTransactionDetail],
[VoucherNo],
[VoucherType],
[CashorBankAccount],
[ChequeNo],
[RecieptType],
[fkAccountID],
[fkAccountType],
[fkVillageID],
[VillageName],
[IsCompanyAccount],
[AccountHolder],
[fkBillID],
[fkBillDetailID],
[fkExportMasterID],
[fkExportItemDetailID],
[TransactionDate],
[TransactionDetail],
[Folio],
[DebitAmount],
[CreditAmount],
[IsDebitOrCredit],
[BalanceAmount],
[Remark],
[Comment],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[fkCashBookID],
[fkItemSaleDetailID],
[PanaFlag],
[PanaActualAmount],
[PanaAspectedAmount],
[PanaPaidAmount],
[PanaDiscount],
[PanaPercent],
[PanaSystemPercent],
[IsExport],
[IsPurchase],
[IsSale],
[RemarkItemSale],
[PurchaseAmount],
[SaleAmount],
[RateDiffAmount],
[Sysdate],
[fkBillPaymentID]
) 
values(
@AccountTransactionNo,
@AccountTransactionCode,
@AccountTransactionDetail,
@VoucherNo,
@VoucherType,
@CashorBankAccount,
@ChequeNo,
@RecieptType,
@fkAccountID,
@fkAccountType,
@fkVillageID,
@VillageName,
@IsCompanyAccount,
@AccountHolder,
@fkBillID,
@fkBillDetailID,
@fkExportMasterID,
@fkExportItemDetailID,
@TransactionDate,
@TransactionDetail,
@Folio,
@DebitAmount,
@CreditAmount,
@IsDebitOrCredit,
@BalanceAmount,
@Remark,
@Comment,
@fkBranchID,
@IsActive,
@InsertDate,
@ModifyDate,
@CreatedBy,
@ModifiedBy,
@fkCashBookID,
@fkItemSaleDetailID,
@PanaFlag,
@PanaActualAmount,
@PanaAspectedAmount,
@PanaPaidAmount,
@PanaDiscount,
@PanaPercent,
@PanaSystemPercent,
@IsExport,
@IsPurchase,
@IsSale,
@RemarkItemSale,
@PurchaseAmount,
@SaleAmount,
@RateDiffAmount,
@Sysdate,
@fkBillPaymentID
)
RETURN Scope_identity()