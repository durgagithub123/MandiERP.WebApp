
CREATE PROCEDURE [dbo].[AccountTransactionLedgers_UpdateByID] 
	(
@AccountTransactionLedgerID bigint,
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
Update  AccountTransactionLedgers Set 
[AccountTransactionLedgerNo]=@AccountTransactionLedgerNo,
[fkAccountID]=@fkAccountID,
[IsCompanyAccount]=@IsCompanyAccount,
[LedgerBalance]=@LedgerBalance,
[TransactionDate]=@TransactionDate,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[AccountTransactionLedgerID]=@AccountTransactionLedgerID


Return
