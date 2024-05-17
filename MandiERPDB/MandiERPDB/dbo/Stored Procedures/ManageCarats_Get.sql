﻿Create PROCEDURE [dbo].[ManageCarats_Get] 
AS
Select 
[ManageCaratID],
[ManageCaratNo],
[ManageCaratCode],
[ManageCaratDetail],
[fkAccountID],
[IsCompanyAccount],
[fkBillID],
[fkExportID],
[TransactionDate],
[TransactionDetail],
[DebitCarat],
[CreditCarat],
[IsDebitOrCredit],
[BalanceCarat],
[RecieptType],
[Remark],
[Comment],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

from 
ManageCarats
Return