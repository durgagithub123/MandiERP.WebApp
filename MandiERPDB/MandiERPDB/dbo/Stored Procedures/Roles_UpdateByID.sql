
CREATE PROCEDURE [dbo].[Roles_UpdateByID] 
	(
@RoleID int,
@RoleNo int=null,
@RoleName varchar(50)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Update  Roles Set 
[RoleNo]=@RoleNo,
[RoleName]=@RoleName,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[RoleID]=@RoleID


Return
