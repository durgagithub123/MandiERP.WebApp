
CREATE PROCEDURE [dbo].[UserCMS_UpdateByID] 
	(
@UserCMSID int,
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
Update  UserCMS Set 
[UserCMSNo]=@UserCMSNo,
[Attribute]=@Attribute,
[Value]=@Value,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[UserCMSID]=@UserCMSID


Return
