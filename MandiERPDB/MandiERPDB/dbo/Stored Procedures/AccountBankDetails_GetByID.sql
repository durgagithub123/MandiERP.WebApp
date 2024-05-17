
CREATE PROCEDURE [dbo].[AccountBankDetails_GetByID] 
	(
@AccountBankDetailID bigint
)
AS
SELECT	 
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

FROM 
AccountBankDetails  
WHERE 
[AccountBankDetailID]=@AccountBankDetailID


RETURN
