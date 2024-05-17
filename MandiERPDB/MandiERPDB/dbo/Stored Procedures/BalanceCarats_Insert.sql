
CREATE PROCEDURE [dbo].[BalanceCarats_Insert] 
	(
@BalanceCaratNo bigint=null,
@fkAccountID bigint=null,
@IsCompanyAccount varchar(50)=null,
@LedgerCarat int=null,
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
BalanceCarats 
(
[BalanceCaratNo],
[fkAccountID],
[IsCompanyAccount],
[LedgerCarat],
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
@BalanceCaratNo,
@fkAccountID,
@IsCompanyAccount,
@LedgerCarat,
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
