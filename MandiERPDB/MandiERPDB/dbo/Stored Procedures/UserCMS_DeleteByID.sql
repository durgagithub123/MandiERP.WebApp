
Create PROCEDURE [dbo].[UserCMS_DeleteByID] 
	(
@UserCMSID int
)
AS
Delete  from 
UserCMS 
where 
[UserCMSID]=@UserCMSID


Return
