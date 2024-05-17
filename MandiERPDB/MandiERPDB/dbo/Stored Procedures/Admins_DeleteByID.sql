
Create PROCEDURE [dbo].[Admins_DeleteByID] 
	(
@AdminID int
)
AS
Delete  from 
Admins 
where 
[AdminID]=@AdminID


Return
