﻿Create PROCEDURE [dbo].[CashBooks_Get] 
AS
Select 
[CashBookID],
[CashBookNo],
[CashBookCode],
[CashBookDetail],
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
[fkBillID],
[Sysdate]

from 
CashBooks
Return