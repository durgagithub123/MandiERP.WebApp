--========================================
-- Author:		Arun Patidar
-- Create date: 08 May 2015
-- Description:	Get Batao khata (Cash Discount ID )
-- =============================================
CREATE FUNCTION [dbo].[fun_GetCashDiscountID]()
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @CID int

	-- Add the T-SQL statements to compute the return value here
	SELECT @CID = 30

	-- Return the result of the function
	RETURN @CID

END
