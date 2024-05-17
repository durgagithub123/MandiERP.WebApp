
Create PROCEDURE [dbo].[BillDetails_DeleteByID] 
	(
@BillDetailID bigint
)
AS
Delete  from 
BillDetails 
where 
[BillDetailID]=@BillDetailID


Return
