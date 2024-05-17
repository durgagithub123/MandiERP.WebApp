
Create PROCEDURE [dbo].[ManageCarats_DeleteByID] 
	(
@ManageCaratID bigint
)
AS
Delete  from 
ManageCarats 
where 
[ManageCaratID]=@ManageCaratID


Return
