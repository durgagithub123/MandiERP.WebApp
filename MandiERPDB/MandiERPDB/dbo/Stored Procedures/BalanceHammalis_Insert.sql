
CREATE PROCEDURE [dbo].[BalanceHammalis_Insert] 
	(
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
Insert Into 
BalanceHammalis 
(
[BalanceHammaliNo],
[BalanceHammaliCode],
[fkAccountID],
[IsCompanyAccount],
[LedgerHammali],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]
) 
values(
@BalanceHammaliNo,
@BalanceHammaliCode,
@fkAccountID,
@IsCompanyAccount,
@LedgerHammali,
@fkBranchID,
@IsActive,
@InsertDate,
@ModifyDate,
@CreatedBy,
@ModifiedBy,
@Sysdate
)
RETURN Scope_identity()
