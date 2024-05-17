
Create PROCEDURE [dbo].[BalanceCarats_DeleteByID] 
	(
@BalanceCaratID bigint
)
AS
Delete  from 
BalanceCarats 
where 
[BalanceCaratID]=@BalanceCaratID


Return
