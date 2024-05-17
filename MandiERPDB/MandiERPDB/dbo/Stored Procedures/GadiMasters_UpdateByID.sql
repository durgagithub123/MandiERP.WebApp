
CREATE PROCEDURE [dbo].[GadiMasters_UpdateByID] 
	(
@GadiMasterID int,
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
Update  GadiMasters Set 
[GadiMasterNo]=@GadiMasterNo,
[GadiNo]=@GadiNo,
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
[GadiMasterID]=@GadiMasterID


Return
