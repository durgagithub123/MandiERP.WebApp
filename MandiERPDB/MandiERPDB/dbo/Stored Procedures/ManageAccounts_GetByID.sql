
CREATE PROCEDURE [dbo].[ManageAccounts_GetByID] 
	(
@ManageAccountID bigint
)
AS
SELECT	 
[ManageAccountID],
[ManageAccountNo],
[fkAccountID],
[fkAccountTypeID],
[IsShowonPage],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

FROM 
ManageAccounts  
WHERE 
[ManageAccountID]=@ManageAccountID


RETURN
