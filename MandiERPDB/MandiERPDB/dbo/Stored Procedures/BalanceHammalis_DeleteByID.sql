
Create PROCEDURE [dbo].[BalanceHammalis_DeleteByID] 
	(
@BalanceHammaliID bigint
)
AS
Delete  from 
BalanceHammalis 
where 
[BalanceHammaliID]=@BalanceHammaliID


Return
