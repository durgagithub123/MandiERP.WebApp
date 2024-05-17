
CREATE PROCEDURE [dbo].[BalanceHammalis_UpdateByID] 
	(
@BalanceHammaliID bigint,
@BalanceHammaliNo bigint=null,
@BalanceHammaliCode varchar(100)=null,
@fkAccountID bigint=null,
@IsCompanyAccount varchar(50)=null,
@LedgerHammali decimal=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@Sysdate datetime=null
)
AS
Update  BalanceHammalis Set 
[BalanceHammaliNo]=@BalanceHammaliNo,
[BalanceHammaliCode]=@BalanceHammaliCode,
[fkAccountID]=@fkAccountID,
[IsCompanyAccount]=@IsCompanyAccount,
[LedgerHammali]=@LedgerHammali,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[BalanceHammaliID]=@BalanceHammaliID


Return
