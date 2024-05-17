
CREATE PROCEDURE [dbo].[Company_GetByID] 
	(
@CompanyID int
)
AS
SELECT	 
[CompanyID],
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

FROM 
Company  
WHERE 
[CompanyID]=@CompanyID


RETURN
