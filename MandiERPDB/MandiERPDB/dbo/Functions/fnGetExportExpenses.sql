-- =============================================
-- Author:		Arun
-- Create date: 
-- Description:	Get Bill Expenses
-- Test case :  select * from dbo.fnGetExportExpenses(1, 'Export')
-- =============================================
CREATE FUNCTION [dbo].[fnGetExportExpenses] (
	-- Add the parameters for the function here
	@ExportMasterID INT,
	@ExpenseTypeFilter varchar(50)
	)
RETURNS @Expense TABLE (
	-- Add the column definitions for the TABLE variable here
	ExportMasterID INT
	,KeyColumn VARCHAR(50)
	,KeyValue DECIMAL(10, 2)
	,AccountID INT
	)
AS
BEGIN

	
	-- Fill the table variable with the rows for your result set
	;With CTE as 
	( select *
		from ExportExpenses where fkExportID = @ExportMasterID
	)
		
	
	INSERT INTO @Expense (
		ExportMasterID
		,KeyColumn
		,KeyValue
		)
	SELECT fkExportID
		,Code
		,Value
	FROM CTE
	UNPIVOT(value FOR code IN (
				[TotalGadiBhada]
				,[TotalAdvance]
				,[TotalHammali]
				,[TotalTulai]
				--,[TotalBarwai]
				--,[TotalMaidanHammali]
				--,[TotalPalaKarai]
				--,[TotalThelaBhada]
				,[TotalBardan]
				,[TotalOthersExp]
				,[TotalCommissionExp]
				,[TotalMandiTax]
				,[TotalLabourCharge]
				,[TotalDhulaiCharge]
				--,[OtherExpense1]
				--,[OtherExpense2]
				--,[OtherExpense3]
				--,[OtherExpense4]
				--,[OtherExpense5]
				,[GatePassAmount]
				,[StoreBhadaAmount]
				,[DalaAmount]
				)) unpiv

	UPDATE e
	SET AccountID = a.AccountID
	FROM @Expense e
	INNER JOIN Accounts a ON a.AccountCode = e.KeyColumn
		AND a.AccountFirmCode = @ExpenseTypeFilter

	RETURN
END


