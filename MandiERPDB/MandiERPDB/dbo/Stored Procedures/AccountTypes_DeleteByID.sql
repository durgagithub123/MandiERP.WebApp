
Create PROCEDURE [dbo].[AccountTypes_DeleteByID] 
	(
@AccountTypeID int
)
AS
Delete  from 
AccountTypes 
where 
[AccountTypeID]=@AccountTypeID


Return
