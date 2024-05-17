
Create PROCEDURE [dbo].[Configurations_DeleteByID] 
	(
@ConfigurationID int
)
AS
Delete  from 
Configurations 
where 
[ConfigurationID]=@ConfigurationID


Return
