
CREATE PROCEDURE [dbo].[GadiMasters_Insert] 
	(
@GadiMasterNo int=null,
@GadiNo nvarchar(500)=null,
@Address nvarchar(250)=null,
@City nvarchar(250)=null,
@State nvarchar(50)=null,
@Country nvarchar(150)=null,
@PinCode decimal=null,
@MobileNo varchar(50)=null,
@PhoneNo nvarchar(50)=null,
@EmailID nvarchar(50)=null,
@FaxNo decimal=null,
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
GadiMasters 
(
[GadiMasterNo],
[GadiNo],
[Address],
[City],
[State],
[Country],
[PinCode],
[MobileNo],
[PhoneNo],
[EmailID],
[FaxNo],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@GadiMasterNo,
@GadiNo,
@Address,
@City,
@State,
@Country,
@PinCode,
@MobileNo,
@PhoneNo,
@EmailID,
@FaxNo,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
