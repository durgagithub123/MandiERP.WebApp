
Create PROCEDURE [dbo].[BillExpenses_DeleteByID] 
	(
@BillExpenseID bigint
)
AS
Delete  from 
BillExpenses 
where 
[BillExpenseID]=@BillExpenseID


Return
