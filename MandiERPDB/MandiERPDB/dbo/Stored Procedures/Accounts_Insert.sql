﻿
CREATE PROCEDURE [dbo].[Accounts_Insert] 
	(
@AccountNo bigint=null,
@AccountFirmName nvarchar(500)=null,
@AccountFirmNameHindi nvarchar(500)=null,
@AccountSortName nvarchar(50)=null,
@AccountHolderDetail nvarchar(500)=null,
@fkAccountTypeID int=null,
@AccountCode varchar(50)=null,
@AccountFirmCode varchar(100)=null,
@fkVillageID bigint=null,
@AccountName nvarchar(500)=null,
@AccountNameHindi nvarchar(500)=null,
@AccountMobileNo nvarchar(100)=null,
@AccountPhoneNo nvarchar(100)=null,
@AccountAddress1 nvarchar(500)=null,
@AccountAddress2 nvarchar(500)=null,
@AccountCity nvarchar(100)=null,
@AccountState nvarchar(100)=null,
@AccountZip nvarchar(100)=null,
@AccountPanNo varchar(50)=null,
@IsShowonPage varchar(10)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@LicenceNo varchar(250)=null,
@EmailID varchar(2000)=null,
@Sysdate datetime=null,
@fkBankAccountID int=null,
@fkAccountBankDetailID int=null,
@Remark varchar(500)=null
)
AS
Insert Into 
Accounts 
(
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
) 
values(
@AccountNo,
@AccountFirmName,
@AccountFirmNameHindi,
@AccountSortName,
@AccountHolderDetail,
@fkAccountTypeID,
@AccountCode,
@AccountFirmCode,
@fkVillageID,
@AccountName,
@AccountNameHindi,
@AccountMobileNo,
@AccountPhoneNo,
@AccountAddress1,
@AccountAddress2,
@AccountCity,
@AccountState,
@AccountZip,
@AccountPanNo,
@IsShowonPage,
@fkBranchID,
@IsActive,
@InsertDate,
@ModifyDate,
@CreatedBy,
@ModifiedBy,
@LicenceNo,
@EmailID,
@Sysdate,
@fkBankAccountID,
@fkAccountBankDetailID,
@Remark
)
RETURN Scope_identity()