
Create PROCEDURE [dbo].[BillTypes_DeleteByID] 
	(
@BillTypeID int
)
AS
Delete  from 
BillTypes 
where 
[BillTypeID]=@BillTypeID


Return
