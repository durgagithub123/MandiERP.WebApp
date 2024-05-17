
Create PROCEDURE [dbo].[CompanyMaster_DeleteByID] 
	(
@cCode int
)
AS
Delete  from 
CompanyMaster 
where 
[cCode]=@cCode


Return
