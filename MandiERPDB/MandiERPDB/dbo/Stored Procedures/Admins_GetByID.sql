
CREATE PROCEDURE [dbo].[Admins_GetByID] 
	(
@AdminID int
)
AS
SELECT	 
[AdminID],
[UserName],
[Password],
[IsAdmin],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
Admins  
WHERE 
[AdminID]=@AdminID


RETURN
