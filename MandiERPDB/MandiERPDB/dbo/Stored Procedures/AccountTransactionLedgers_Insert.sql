
CREATE PROCEDURE [dbo].[AccountTransactionLedgers_Insert] 
	(
@AccountTransactionLedgerNo bigint=null,
@fkAccountID bigint=null,
@IsCompanyAccount varchar(50)=null,
@LedgerBalance int=null,
@TransactionDate datetime=null,
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
AccountTransactionLedgers 
(
[AccountTransactionLedgerNo],
[fkAccountID],
[IsCompanyAccount],
[LedgerBalance],
[TransactionDate],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]
) 
values(
@AccountTransactionLedgerNo,
@fkAccountID,
@IsCompanyAccount,
@LedgerBalance,
@TransactionDate,
@fkBranchID,
@IsActive,
@InsertDate,
@ModifyDate,
@CreatedBy,
@ModifiedBy,
@Sysdate
)
RETURN Scope_identity()
