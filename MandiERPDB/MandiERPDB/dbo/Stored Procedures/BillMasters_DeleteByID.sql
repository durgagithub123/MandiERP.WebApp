
Create PROCEDURE [dbo].[BillMasters_DeleteByID] 
	(
@BillMasterID int
)
AS
Delete  from 
BillMasters 
where 
[BillMasterID]=@BillMasterID


Return
