
CREATE PROCEDURE [dbo].[BalanceDailyStocks_Insert] 
	(
@BalanceDailyStockNo bigint=null,
@BalanceDailyStockCode varchar(100)=null,
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
Insert Into 
BalanceDailyStocks 
(
[BalanceDailyStockNo],
[BalanceDailyStockCode],
[fkAccountID],
[IsCompanyAccount],
[LedgerStock],
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
@BalanceDailyStockNo,
@BalanceDailyStockCode,
@fkAccountID,
@IsCompanyAccount,
@LedgerStock,
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
