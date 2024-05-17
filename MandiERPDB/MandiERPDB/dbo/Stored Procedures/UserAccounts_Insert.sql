
CREATE PROCEDURE [dbo].[UserAccounts_Insert] 
	(
@UserAccountNo int=null,
@fkUserID int=null,
@Password varchar(250),
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Insert Into 
UserAccounts 
(
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
) 
values(
@UserAccountNo,
@fkUserID,
@Password,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
