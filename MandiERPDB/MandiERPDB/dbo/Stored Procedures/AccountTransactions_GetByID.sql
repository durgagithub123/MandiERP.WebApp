﻿
CREATE PROCEDURE [dbo].[AccountTransactions_GetByID] 
	(
@AccountTransactionID bigint
)
AS
SELECT	 
[AccountTransactionID],
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

FROM 
AccountTransactions  
WHERE 
[AccountTransactionID]=@AccountTransactionID


RETURN