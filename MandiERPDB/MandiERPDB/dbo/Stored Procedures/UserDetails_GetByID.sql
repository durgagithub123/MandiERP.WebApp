
CREATE PROCEDURE [dbo].[UserDetails_GetByID] 
	(
@UserDetailID int
)
AS
SELECT	 
[UserDetailID],
[UserDetailNo],
[fkUserID],
[FirstName],
[Middleame],
[LastName],
[PhoneNo],
[MobileNo],
[City],
[State],
[Zip],
[Address],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
UserDetails  
WHERE 
[UserDetailID]=@UserDetailID


RETURN
