
CREATE PROCEDURE [dbo].[Users_GetByID] 
	(
@UserID int
)
AS
SELECT	 
[UserID],
[UserNo],
[UserName],
[IsAdmin],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
Users  
WHERE 
[UserID]=@UserID


RETURN
