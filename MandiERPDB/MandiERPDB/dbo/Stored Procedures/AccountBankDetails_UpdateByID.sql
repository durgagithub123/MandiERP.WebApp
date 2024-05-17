
CREATE PROCEDURE [dbo].[AccountBankDetails_UpdateByID] 
	(
@AccountBankDetailID bigint,
@AccountBankDetailNo bigint=null,
@fkAccountID bigint=null,
@BankAccountNo varchar(100)=null,
@BranchNo varchar(50)=null,
@BranchName varchar(50)=null,
@IfscCode varchar(50)=null,
@PanNo varchar(50)=null,
@AccountHolderName varchar(50)=null,
@Detail varchar(50)=null,
@Comments varchar(500)=null,
@IsShowonPage varchar(10)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@Sysdate datetime=null
)
AS
Update  AccountBankDetails Set 
[AccountBankDetailNo]=@AccountBankDetailNo,
[fkAccountID]=@fkAccountID,
[BankAccountNo]=@BankAccountNo,
[BranchNo]=@BranchNo,
[BranchName]=@BranchName,
[IfscCode]=@IfscCode,
[PanNo]=@PanNo,
[AccountHolderName]=@AccountHolderName,
[Detail]=@Detail,
[Comments]=@Comments,
[IsShowonPage]=@IsShowonPage,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[AccountBankDetailID]=@AccountBankDetailID


Return
