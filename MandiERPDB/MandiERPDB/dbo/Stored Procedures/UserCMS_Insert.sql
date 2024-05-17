
CREATE PROCEDURE [dbo].[UserCMS_Insert] 
	(
@UserCMSNo int=null,
@Attribute nvarchar(250)=null,
@Value nvarchar(1000)=null,
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
UserCMS 
(
[UserCMSNo],
[Attribute],
[Value],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@UserCMSNo,
@Attribute,
@Value,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
