
Create PROCEDURE [dbo].[CashBooks_DeleteByID] 
	(
@CashBookID bigint
)
AS
Delete  from 
CashBooks 
where 
[CashBookID]=@CashBookID


Return
