
CREATE PROCEDURE [dbo].[AccountDetails_UpdateByID] 
	(
@AccountDetailID bigint,
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
Update  AccountDetails Set 
[AccountDetailNo]=@AccountDetailNo,
[fkAccountID]=@fkAccountID,
[Name]=@Name,
[NameHindi]=@NameHindi,
[MobileNo]=@MobileNo,
[PhoneNo]=@PhoneNo,
[Address1]=@Address1,
[Address2]=@Address2,
[City]=@City,
[State]=@State,
[Zip]=@Zip,
[Country]=@Country,
[PanNo]=@PanNo,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[AccountDetailID]=@AccountDetailID


Return
