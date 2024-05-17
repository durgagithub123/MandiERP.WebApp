
CREATE PROCEDURE [dbo].[Users_UpdateByID] 
	(
@UserID int,
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
Update  Users Set 
[UserNo]=@UserNo,
[UserName]=@UserName,
[IsAdmin]=@IsAdmin,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[UserID]=@UserID


Return
