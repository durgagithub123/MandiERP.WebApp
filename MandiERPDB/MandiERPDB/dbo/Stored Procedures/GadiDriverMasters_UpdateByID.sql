
CREATE PROCEDURE [dbo].[GadiDriverMasters_UpdateByID] 
	(
@GadiDriverMasterID int,
@GadiDriverMasterNo int=null,
@fkGadiMasterID int=null,
@DriverName nvarchar(500)=null,
@DriverNameHindi nvarchar(500)=null,
@Address nvarchar(250)=null,
@City nvarchar(250)=null,
@State nvarchar(50)=null,
@Country nvarchar(150)=null,
@PinCode decimal=null,
@MobileNo varchar(50)=null,
@PhoneNo nvarchar(50)=null,
@EmailID nvarchar(50)=null,
@FaxNo nvarchar(150)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Update  GadiDriverMasters Set 
[GadiDriverMasterNo]=@GadiDriverMasterNo,
[fkGadiMasterID]=@fkGadiMasterID,
[DriverName]=@DriverName,
[DriverNameHindi]=@DriverNameHindi,
[Address]=@Address,
[City]=@City,
[State]=@State,
[Country]=@Country,
[PinCode]=@PinCode,
[MobileNo]=@MobileNo,
[PhoneNo]=@PhoneNo,
[EmailID]=@EmailID,
[FaxNo]=@FaxNo,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[GadiDriverMasterID]=@GadiDriverMasterID


Return
