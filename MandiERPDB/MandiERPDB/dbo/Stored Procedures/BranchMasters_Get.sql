Create PROCEDURE [dbo].[BranchMasters_Get] 
AS
Select 
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

from 
BranchMasters
Return
