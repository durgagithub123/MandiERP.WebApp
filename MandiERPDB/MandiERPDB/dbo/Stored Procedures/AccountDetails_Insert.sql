
CREATE PROCEDURE [dbo].[AccountDetails_Insert] 
	(
@AccountDetailNo bigint=null,
@fkAccountID bigint=null,
@Name nvarchar(500)=null,
@NameHindi nvarchar(500)=null,
@MobileNo varchar(50)=null,
@PhoneNo nvarchar(50)=null,
@Address1 nvarchar(250)=null,
@Address2 nvarchar(250)=null,
@City nvarchar(50)=null,
@State nvarchar(50)=null,
@Zip decimal=null,
@Country nvarchar(50)=null,
@PanNo varchar(50)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@Sysdate datetime=null
)
AS
Insert Into 
AccountDetails 
(
[AccountDetailNo],
[fkAccountID],
[Name],
[NameHindi],
[MobileNo],
[PhoneNo],
[Address1],
[Address2],
[City],
[State],
[Zip],
[Country],
[PanNo],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]
) 
values(
@AccountDetailNo,
@fkAccountID,
@Name,
@NameHindi,
@MobileNo,
@PhoneNo,
@Address1,
@Address2,
@City,
@State,
@Zip,
@Country,
@PanNo,
@fkBranchID,
@IsActive,
@InsertDate,
@ModifyDate,
@CreatedBy,
@ModifiedBy,
@Sysdate
)
RETURN Scope_identity()
