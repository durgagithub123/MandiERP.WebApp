
CREATE PROCEDURE [dbo].[UserLogin_Insert] 
	(
@UserLoginNo bigint=null,
@fkUserID int,
@LoginDate datetime=null,
@Logout datetime=null,
@LoginMessage nvarchar(500)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateDate datetime=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Insert Into 
UserLogin 
(
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
) 
values(
@UserLoginNo,
@fkUserID,
@LoginDate,
@Logout,
@LoginMessage,
@fkBranchID,
@IsActive,
@CreateDate,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
