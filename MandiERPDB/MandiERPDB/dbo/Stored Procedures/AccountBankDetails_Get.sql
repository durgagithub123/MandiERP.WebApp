Create PROCEDURE [dbo].[AccountBankDetails_Get] 
AS
Select 
[AccountBankDetailID],
[AccountBankDetailNo],
[fkAccountID],
[BankAccountNo],
[BranchNo],
[BranchName],
[IfscCode],
[PanNo],
[AccountHolderName],
[Detail],
[Comments],
[IsShowonPage],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

from 
AccountBankDetails
Return
