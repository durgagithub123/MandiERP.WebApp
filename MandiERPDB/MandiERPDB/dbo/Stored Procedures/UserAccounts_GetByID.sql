
CREATE PROCEDURE [dbo].[UserAccounts_GetByID] 
	(
@UserAccountID int
)
AS
SELECT	 
[UserAccountID],
[UserAccountNo],
[fkUserID],
[Password],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
UserAccounts  
WHERE 
[UserAccountID]=@UserAccountID


RETURN
