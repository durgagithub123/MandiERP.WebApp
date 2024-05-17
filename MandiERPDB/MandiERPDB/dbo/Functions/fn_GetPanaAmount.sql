-- =============================================
-- Author:		Ankit Patidar
-- Create date: 18-Jul-2022
-- Description:	Get Pana PreviousAmount Details
-- select dbo.fn_GetPanaAmount(57,'05-Jul-2022 12:00:00 AM','05-Jul-2022 12:00:00 AM','OB')
-- =============================================
Create FUNCTION [dbo].[fn_GetPanaAmount] 
(
	-- Add the parameters for the function here
	@AccountId bigint
	,@FromDate date
	,@ToDate  date
	,@Flag varchar(2) -- 0- Opening Balance, 1- 
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Openining Balance
	if(@Flag = 'OB')
	begin
		-- Add the T-SQL statements to compute the return value here
		set @Result = (select SUM(CreditAmount)- SUM(DebitAmount) from AccountTransactions where IsActive != '0' and fkAccountID = @AccountId
			and CONVERT(VARCHAR(10), TransactionDate, 112) < CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112) 
		)
	end
	
	if(@Flag = 'TS')
	begin
		-- Add the T-SQL statements to compute the return value here
		set @Result = (select SUM(TotalAmount) from ItemSaleDetails where IsActive != '0' and fkAccountID = @AccountId
			and CONVERT(VARCHAR(10), CreateDate, 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112) 
			and CONVERT(VARCHAR(10), CreateDate, 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112) 
		)
	end
	if(@Flag = 'TP')
	begin
		-- Add the T-SQL statements to compute the return value here
		set @Result = (select SUM(BillTotalAmount) from Bills inner join BillDetails on Bills.BillID = BillDetails.fkBillID
		 where BillDetails.IsActive != '0' and fkAccountID = @AccountId
			and CONVERT(VARCHAR(10), BillDate, 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112) 
			and CONVERT(VARCHAR(10), BillDate, 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112) 
			)
	end
	if(@Flag = 'AP')
	begin
		-- Add the T-SQL statements to compute the return value here
		set @Result = (select SUM(DebitAmount) from CashBooks 
		 where IsActive != '0' and fkAccountID = @AccountId
			and CONVERT(VARCHAR(10), TransactionDate, 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112) 
			and CONVERT(VARCHAR(10), TransactionDate, 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112) 
			)
	end
	if(@Flag = 'AR')
	begin
		-- Add the T-SQL statements to compute the return value here
		set @Result = (select SUM(CreditAmount) from CashBooks 
		 where IsActive != '0' and fkAccountID = @AccountId
			and CONVERT(VARCHAR(10), TransactionDate, 112) >= CONVERT(VARCHAR(10), convert(DATETIME, @FromDate), 112) 
			and CONVERT(VARCHAR(10), TransactionDate, 112) <= CONVERT(VARCHAR(10), convert(DATETIME, @ToDate), 112) 
			)
	end
	-- Return the result of the function
	RETURN @Result

END
