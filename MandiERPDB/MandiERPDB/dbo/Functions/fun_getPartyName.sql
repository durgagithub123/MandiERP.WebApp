-- Test case : select dbo.[fun_getPartyName](1,'')
create FUNCTION [dbo].[fun_getPartyName] 
(
	-- Add the parameters for the function here
	@BillDetailID int,
	@ShortNameFlag varchar(10)
)
RETURNS varchar(250)
AS
BEGIN
	declare @Result varchar(250)
	
	if(@ShortNameFlag ='')
	begin
	set   @Result=(select top 1  A.AccountName
	FROM         BillDetails BD INNER JOIN
					dbo.ItemSaleDetails ISD on BD.BillDetailID = ISD.fkBillDetailID
					inner join     Accounts A ON
					 ISD.fkAccountID = A.AccountID 
                      where BillDetailID=@BillDetailID)
	
	

	
	end
	else
	begin
		set   @Result= (select top 1 A.AccountSortName
			FROM         BillDetails BD INNER JOIN
					dbo.ItemSaleDetails ISD on BD.BillDetailID = ISD.fkBillDetailID
					inner join     Accounts A ON
					 ISD.fkAccountID = A.AccountID 
                      where BillDetailID=@BillDetailID)
	end
	return @Result

END
