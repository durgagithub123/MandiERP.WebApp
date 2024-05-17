
CREATE PROCEDURE [dbo].[Admins_Insert] 
	(
@UserName varchar(250),
@Password varchar(250),
@IsAdmin varchar(20)=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Insert Into 
Admins 
(
[UserName],
[Password],
[IsAdmin],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@UserName,
@Password,
@IsAdmin,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
