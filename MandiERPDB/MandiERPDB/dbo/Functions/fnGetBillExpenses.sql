-- =============================================
-- Author:		Arun
-- Create date: 
-- Description:	Get Bill Expenses
-- Test case :  select * from dbo.fngetBillExpenses(1, 'Bill')
-- =============================================
CREATE FUNCTION [dbo].[fnGetBillExpenses] (
	-- Add the parameters for the function here
	@BillID INT,
	@ExpenseTypeFilter varchar(50)
	)
RETURNS @Expense TABLE (
	-- Add the column definitions for the TABLE variable here
	BillID INT
	,KeyColumn VARCHAR(50)
	,KeyValue DECIMAL(10, 2)
	,AccountID INT
	)
AS
BEGIN

	
	-- Fill the table variable with the rows for your result set
	;With CTE as 
	( select *
		from BillExpenses where fkBillID = @BillID
			and ( BillExpenseCode= '2' or BillExpenseCode= '')
	)
		
	
	INSERT INTO @Expense (
		BillID
		,KeyColumn
		,KeyValue
		)
	SELECT fkBillID
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


