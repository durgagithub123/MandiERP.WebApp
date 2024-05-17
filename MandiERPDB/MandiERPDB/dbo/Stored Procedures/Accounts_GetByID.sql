
CREATE PROCEDURE [dbo].[Accounts_GetByID] 
	(
@AccountID bigint
)
AS
SELECT	 
[AccountID],
[AccountNo],
[AccountFirmName],
[AccountFirmNameHindi],
[AccountSortName],
[AccountHolderDetail],
[fkAccountTypeID],
[AccountCode],
[AccountFirmCode],
[fkVillageID],
[AccountName],
[AccountNameHindi],
[AccountMobileNo],
[AccountPhoneNo],
[AccountAddress1],
[AccountAddress2],
[AccountCity],
[AccountState],
[AccountZip],
[AccountPanNo],
[IsShowonPage],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[LicenceNo],
[EmailID],
[Sysdate],
[fkBankAccountID],
[fkAccountBankDetailID],
[Remark]

FROM 
Accounts  
WHERE 
[AccountID]=@AccountID


RETURN
