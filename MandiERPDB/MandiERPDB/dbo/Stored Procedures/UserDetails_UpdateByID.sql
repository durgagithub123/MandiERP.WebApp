
CREATE PROCEDURE [dbo].[UserDetails_UpdateByID] 
	(
@UserDetailID int,
@UserDetailNo int=null,
@fkUserID int,
@FirstName nvarchar(250),
@Middleame nvarchar(250)=null,
@LastName nvarchar(250)=null,
@PhoneNo nvarchar(50)=null,
@MobileNo nvarchar(50)=null,
@City nvarchar(250)=null,
@State nvarchar(250)=null,
@Zip nvarchar(250)=null,
@Address nvarchar(1000)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Update  UserDetails Set 
[UserDetailNo]=@UserDetailNo,
[fkUserID]=@fkUserID,
[FirstName]=@FirstName,
[Middleame]=@Middleame,
[LastName]=@LastName,
[PhoneNo]=@PhoneNo,
[MobileNo]=@MobileNo,
[City]=@City,
[State]=@State,
[Zip]=@Zip,
[Address]=@Address,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[UserDetailID]=@UserDetailID


Return
