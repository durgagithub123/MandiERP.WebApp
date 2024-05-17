
CREATE PROCEDURE [dbo].[UserLogin_GetByID] 
	(
@UserLoginID bigint
)
AS
SELECT	 
[UserLoginID],
[UserLoginNo],
[fkUserID],
[LoginDate],
[Logout],
[LoginMessage],
[fkBranchID],
[IsActive],
[CreateDate],
[ModifyDate],
[Sysdate]

FROM 
UserLogin  
WHERE 
[UserLoginID]=@UserLoginID


RETURN
