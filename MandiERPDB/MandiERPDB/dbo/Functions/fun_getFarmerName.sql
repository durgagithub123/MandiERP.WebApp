CREATE FUNCTION [dbo].[fun_getFarmerName] 
(
	-- Add the parameters for the function here
	@BillID int,
	@FullNameFlag varchar(10)
)
RETURNS varchar(250)
AS
BEGIN
	declare @Result varchar(250)
	
	if(@FullNameFlag ='')
	begin
	SELECT   @Result=  Accounts.AccountSortName
FROM         Bills INNER JOIN
                      Accounts ON Bills.fkAccountID = Accounts.AccountID INNER JOIN
                      BillDetails ON Bills.BillID = BillDetails.fkBillID
                      where BillID=@BillID
	
	end
	else
	begin
	SELECT   @Result=  Accounts.AccountName
FROM         Bills INNER JOIN
                      Accounts ON Bills.fkAccountID = Accounts.AccountID INNER JOIN
                      BillDetails ON Bills.BillID = BillDetails.fkBillID
                      where BillID=@BillID
	end
	return @Result

END
