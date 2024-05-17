
CREATE PROCEDURE [dbo].[UserLogin_UpdateByID] 
	(
@UserLoginID bigint,
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
Update  UserLogin Set 
[UserLoginNo]=@UserLoginNo,
[fkUserID]=@fkUserID,
[LoginDate]=@LoginDate,
[Logout]=@Logout,
[LoginMessage]=@LoginMessage,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateDate]=@CreateDate,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[UserLoginID]=@UserLoginID


Return
