
CREATE PROCEDURE [dbo].[BalanceStocks_UpdateByID] 
	(
@BalanceStockID bigint,
@BalanceStockNo bigint=null,
@BalanceStockCode varchar(100)=null,
@fkAccountID bigint=null,
@IsCompanyAccount varchar(50)=null,
@LedgerStock bigint=null,
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
Update  BalanceStocks Set 
[BalanceStockNo]=@BalanceStockNo,
[BalanceStockCode]=@BalanceStockCode,
[fkAccountID]=@fkAccountID,
[IsCompanyAccount]=@IsCompanyAccount,
[LedgerStock]=@LedgerStock,
[TransactionDate]=@TransactionDate,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[BalanceStockID]=@BalanceStockID


Return
