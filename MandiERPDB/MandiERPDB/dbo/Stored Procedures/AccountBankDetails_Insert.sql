
CREATE PROCEDURE [dbo].[AccountBankDetails_Insert] 
	(
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
Insert Into 
AccountBankDetails 
(
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
) 
values(
@AccountBankDetailNo,
@fkAccountID,
@BankAccountNo,
@BranchNo,
@BranchName,
@IfscCode,
@PanNo,
@AccountHolderName,
@Detail,
@Comments,
@IsShowonPage,
@fkBranchID,
@IsActive,
@InsertDate,
@ModifyDate,
@CreatedBy,
@ModifiedBy,
@Sysdate
)
RETURN Scope_identity()
