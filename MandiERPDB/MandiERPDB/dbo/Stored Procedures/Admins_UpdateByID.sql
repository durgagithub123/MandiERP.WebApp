
CREATE PROCEDURE [dbo].[Admins_UpdateByID] 
	(
@AdminID int,
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
Update  Admins Set 
[UserName]=@UserName,
[Password]=@Password,
[IsAdmin]=@IsAdmin,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[AdminID]=@AdminID


Return
