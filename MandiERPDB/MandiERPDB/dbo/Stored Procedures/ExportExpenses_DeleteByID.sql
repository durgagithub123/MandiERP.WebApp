
Create PROCEDURE [dbo].[ExportExpenses_DeleteByID] 
	(
@ExportExpenseID bigint
)
AS
Delete  from 
ExportExpenses 
where 
[ExportExpenseID]=@ExportExpenseID


Return
