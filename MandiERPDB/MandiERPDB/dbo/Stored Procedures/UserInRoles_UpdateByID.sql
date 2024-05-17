
CREATE PROCEDURE [dbo].[UserInRoles_UpdateByID] 
	(
@UserInRoleID int,
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
Update  UserInRoles Set 
[UserInRoleNo]=@UserInRoleNo,
[fkUserID]=@fkUserID,
[fkRoleID]=@fkRoleID,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[UserInRoleID]=@UserInRoleID


Return
