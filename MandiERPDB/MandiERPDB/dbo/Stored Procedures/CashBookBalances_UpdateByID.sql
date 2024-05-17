
CREATE PROCEDURE [dbo].[CashBookBalances_UpdateByID] 
	(
@CashBookBalanceID bigint,
@CashBookBalanceNo bigint=null,
@CashBookBalanceCode varchar(100)=null,
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
Update  CashBookBalances Set 
[CashBookBalanceNo]=@CashBookBalanceNo,
[CashBookBalanceCode]=@CashBookBalanceCode,
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
[CashBookBalanceID]=@CashBookBalanceID


Return
