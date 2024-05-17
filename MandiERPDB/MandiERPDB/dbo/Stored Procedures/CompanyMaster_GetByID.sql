
CREATE PROCEDURE [dbo].[CompanyMaster_GetByID] 
	(
@cCode int
)
AS
SELECT	 
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

FROM 
CompanyMaster  
WHERE 
[cCode]=@cCode


RETURN
