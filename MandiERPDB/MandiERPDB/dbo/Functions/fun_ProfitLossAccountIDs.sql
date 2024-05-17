-- =============================================
-- Author:		<Arun Patidar>
-- Create date: <15May16>
-- Description:	<For Profit and Loss>
-- Test Case : select dbo.fun_ProfitLossAccountIDs() 
-- =============================================
CREATE FUNCTION [dbo].[fun_ProfitLossAccountIDs]
(
	-- Add the parameters for the function here
)
RETURNS varchar(max)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(max)

	-- Add the T-SQL statements to compute the return value here
	select @Result = coalesce(@Result+',','') + convert(varchar(10),AccountID) from 
		Accounts with(nolocK) where AccountID in(4,12,18,27,28,29,30)

	-- Return the result of the function
	RETURN @Result

END
