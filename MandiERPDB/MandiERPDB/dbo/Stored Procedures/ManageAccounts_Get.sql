Create PROCEDURE [dbo].[ManageAccounts_Get] 
AS
Select 
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

from 
ManageAccounts
Return
