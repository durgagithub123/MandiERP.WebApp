
Create PROCEDURE [dbo].[Bills_DeleteByID] 
	(
@BillID bigint
)
AS
Delete  from 
Bills 
where 
[BillID]=@BillID


Return
