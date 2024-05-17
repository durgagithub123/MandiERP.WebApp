
Create PROCEDURE [dbo].[BranchMasters_DeleteByID] 
	(
@BranchID int
)
AS
Delete  from 
BranchMasters 
where 
[BranchID]=@BranchID


Return
