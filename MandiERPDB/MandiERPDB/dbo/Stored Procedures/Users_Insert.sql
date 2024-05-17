
CREATE PROCEDURE [dbo].[Users_Insert] 
	(
@UserNo int=null,
@UserName varchar(250),
@IsAdmin varchar(20)=null,
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
Users 
(
[UserNo],
[UserName],
[IsAdmin],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@UserNo,
@UserName,
@IsAdmin,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
