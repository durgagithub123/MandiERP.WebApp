﻿
CREATE PROCEDURE [dbo].[CashBooks_UpdateByID] 
	(
@CashBookID bigint,
@CashBookNo bigint=null,
@CashBookCode varchar(50)=null,
@CashBookDetail varchar(50)=null,
@VoucherNo bigint=null,
@VoucherType varchar(50)=null,
@CashorBankAccount varchar(50)=null,
@ChequeNo varchar(50)=null,
@RecieptType varchar(20)=null,
@fkAccountID bigint=null,
@fkAccountType int=null,
@fkVillageID int=null,
@VillageName varchar(50)=null,
@IsCompanyAccount varchar(50)=null,
@AccountHolder nvarchar(500)=null,
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
@fkBillID int=null,
@Sysdate datetime=null
)
AS
Update  CashBooks Set 
[CashBookNo]=@CashBookNo,
[CashBookCode]=@CashBookCode,
[CashBookDetail]=@CashBookDetail,
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
[fkBillID]=@fkBillID,
[Sysdate]=@Sysdate
 
where 
[CashBookID]=@CashBookID


Return
