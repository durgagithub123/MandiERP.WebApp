--========================================
-- Author:		Arun Patidar
-- Create date: 31 July 2015
-- Description:	Get Company Id
-- =============================================
CREATE FUNCTION [dbo].[fun_GetCompanyID]()
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @CID int

	-- Add the T-SQL statements to compute the return value here
	SELECT @CID = [CompanyAccountID] from  [dbo].[Configurations] with(nolock)

	-- Return the result of the function
	RETURN @CID

END
