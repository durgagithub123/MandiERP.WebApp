
CREATE PROCEDURE [dbo].[CompanyMaster_UpdateByID] 
	(
@cCode int,
@CName varchar(50),
@cContactPerson varchar(50)=null,
@cAddress1 varchar(150)=null,
@cAddress2 varchar(150)=null,
@cPhone varchar(50)=null,
@cMobile varchar(50)=null,
@cEmail varchar(50)=null,
@cPan varchar(50)=null,
@IsActive bit=null,
@cDB varchar(50)=null,
@cFYSdt datetime=null,
@cFYEdt datetime=null,
@ShortName varchar(5)=null,
@PurExpInd varchar(3)=null,
@CommInTO varchar(3)=null,
@LoadingTO varchar(3)=null,
@FBInd varchar(3)=null,
@Sysdate datetime=null
)
AS
Update  CompanyMaster Set 
[cCode]=@cCode,
[CName]=@CName,
[cContactPerson]=@cContactPerson,
[cAddress1]=@cAddress1,
[cAddress2]=@cAddress2,
[cPhone]=@cPhone,
[cMobile]=@cMobile,
[cEmail]=@cEmail,
[cPan]=@cPan,
[IsActive]=@IsActive,
[cDB]=@cDB,
[cFYSdt]=@cFYSdt,
[cFYEdt]=@cFYEdt,
[ShortName]=@ShortName,
[PurExpInd]=@PurExpInd,
[CommInTO]=@CommInTO,
[LoadingTO]=@LoadingTO,
[FBInd]=@FBInd,
[Sysdate]=@Sysdate
 
where 
[cCode]=@cCode


Return
