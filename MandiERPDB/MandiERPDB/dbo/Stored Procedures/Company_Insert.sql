
CREATE PROCEDURE [dbo].[Company_Insert] 
	(
@CompanyNo int=null,
@CompanyName varchar(250)=null,
@CompanyNameHindi nvarchar(250)=null,
@CPlanYear varchar(250)=null,
@CAddress1 varchar(4000)=null,
@CAddress1Hindi nvarchar(4000)=null,
@CAddress2 varchar(4000)=null,
@CAddress2Hindi nvarchar(4000)=null,
@CPhoneNo varchar(100)=null,
@CMobileNo varchar(100)=null,
@CCity varchar(100)=null,
@CState varchar(100)=null,
@CZip varchar(100)=null,
@CEmail varchar(100)=null,
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
Company 
(
[CompanyNo],
[CompanyName],
[CompanyNameHindi],
[CPlanYear],
[CAddress1],
[CAddress1Hindi],
[CAddress2],
[CAddress2Hindi],
[CPhoneNo],
[CMobileNo],
[CCity],
[CState],
[CZip],
[CEmail],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@CompanyNo,
@CompanyName,
@CompanyNameHindi,
@CPlanYear,
@CAddress1,
@CAddress1Hindi,
@CAddress2,
@CAddress2Hindi,
@CPhoneNo,
@CMobileNo,
@CCity,
@CState,
@CZip,
@CEmail,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
