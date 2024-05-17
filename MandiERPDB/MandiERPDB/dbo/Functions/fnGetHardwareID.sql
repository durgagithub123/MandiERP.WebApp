-- =============================================
-- Author:		Arun
-- Create date: 
-- Description:	Get HardwareID
-- =============================================
Create FUNCTION [dbo].[fnGetHardwareID] 
(
	-- Add the parameters for the function here
)
RETURNS varchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(100)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = '6D4FEBFEA7DD728FBFF'

	-- Return the result of the function
	RETURN @Result

END







