
CREATE PROCEDURE [dbo].[BalanceCarats_UpdateByID] 
	(
@BalanceCaratID bigint,
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
Update  BalanceCarats Set 
[BalanceCaratNo]=@BalanceCaratNo,
[fkAccountID]=@fkAccountID,
[IsCompanyAccount]=@IsCompanyAccount,
[LedgerCarat]=@LedgerCarat,
[TransactionDate]=@TransactionDate,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[BalanceCaratID]=@BalanceCaratID


Return
