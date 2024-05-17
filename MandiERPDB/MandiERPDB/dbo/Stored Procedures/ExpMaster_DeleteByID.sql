
Create PROCEDURE [dbo].[ExpMaster_DeleteByID] 
	(
@ExpSNo int
)
AS
Delete  from 
ExpMaster 
where 
[ExpSNo]=@ExpSNo


Return
