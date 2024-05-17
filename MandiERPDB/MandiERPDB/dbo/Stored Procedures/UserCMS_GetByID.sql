
CREATE PROCEDURE [dbo].[UserCMS_GetByID] 
	(
@UserCMSID int
)
AS
SELECT	 
[UserCMSID],
[UserCMSNo],
[Attribute],
[Value],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
UserCMS  
WHERE 
[UserCMSID]=@UserCMSID


RETURN
