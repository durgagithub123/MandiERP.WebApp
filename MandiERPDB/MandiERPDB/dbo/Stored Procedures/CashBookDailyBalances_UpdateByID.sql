
CREATE PROCEDURE [dbo].[CashBookDailyBalances_UpdateByID] 
	(
@CashBookDailyBalanceID bigint,
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
Update  CashBookDailyBalances Set 
[CashBookDailyBalanceNo]=@CashBookDailyBalanceNo,
[CashBookDailyBalanceCode]=@CashBookDailyBalanceCode,
[IsCompanyAccount]=@IsCompanyAccount,
[fkAccountID]=@fkAccountID,
[fkAccountType]=@fkAccountType,
[BalanceAmount]=@BalanceAmount,
[TransactionDate]=@TransactionDate,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[CashBookDailyBalanceID]=@CashBookDailyBalanceID


Return
