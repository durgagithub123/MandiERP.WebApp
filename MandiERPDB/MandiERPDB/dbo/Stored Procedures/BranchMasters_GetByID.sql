
CREATE PROCEDURE [dbo].[BranchMasters_GetByID] 
	(
@BranchID int
)
AS
SELECT	 
[BranchID],
[BranchNo],
[BranchName],
[BranchDetail],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
BranchMasters  
WHERE 
[BranchID]=@BranchID


RETURN
