Create PROCEDURE [dbo].[CompanyMaster_Get] 
AS
Select 
[cCode],
[CName],
[cContactPerson],
[cAddress1],
[cAddress2],
[cPhone],
[cMobile],
[cEmail],
[cPan],
[IsActive],
[cDB],
[cFYSdt],
[cFYEdt],
[ShortName],
[PurExpInd],
[CommInTO],
[LoadingTO],
[FBInd],
[Sysdate]

from 
CompanyMaster
Return
