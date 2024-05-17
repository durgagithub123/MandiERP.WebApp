
Create PROCEDURE [dbo].[Company_DeleteByID] 
	(
@CompanyID int
)
AS
Delete  from 
Company 
where 
[CompanyID]=@CompanyID


Return
