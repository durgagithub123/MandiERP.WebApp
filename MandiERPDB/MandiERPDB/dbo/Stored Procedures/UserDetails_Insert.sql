
CREATE PROCEDURE [dbo].[UserDetails_Insert] 
	(
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
Insert Into 
UserDetails 
(
[UserDetailNo],
[fkUserID],
[FirstName],
[Middleame],
[LastName],
[PhoneNo],
[MobileNo],
[City],
[State],
[Zip],
[Address],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@UserDetailNo,
@fkUserID,
@FirstName,
@Middleame,
@LastName,
@PhoneNo,
@MobileNo,
@City,
@State,
@Zip,
@Address,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
