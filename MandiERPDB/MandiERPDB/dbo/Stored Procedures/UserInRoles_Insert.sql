
CREATE PROCEDURE [dbo].[UserInRoles_Insert] 
	(
@UserInRoleNo int=null,
@fkUserID int,
@fkRoleID int,
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
UserInRoles 
(
[UserInRoleNo],
[fkUserID],
[fkRoleID],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@UserInRoleNo,
@fkUserID,
@fkRoleID,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
