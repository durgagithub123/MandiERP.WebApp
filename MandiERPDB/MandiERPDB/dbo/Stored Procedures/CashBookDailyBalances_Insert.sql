
CREATE PROCEDURE [dbo].[CashBookDailyBalances_Insert] 
	(
@CashBookDailyBalanceNo bigint=null,
@CashBookDailyBalanceCode varchar(100)=null,
@IsCompanyAccount varchar(50)=null,
@fkAccountID bigint=null,
@fkAccountType int=null,
@BalanceAmount decimal,
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
CashBookDailyBalances 
(
[CashBookDailyBalanceNo],
[CashBookDailyBalanceCode],
[IsCompanyAccount],
[fkAccountID],
[fkAccountType],
[BalanceAmount],
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
@CashBookDailyBalanceNo,
@CashBookDailyBalanceCode,
@IsCompanyAccount,
@fkAccountID,
@fkAccountType,
@BalanceAmount,
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
