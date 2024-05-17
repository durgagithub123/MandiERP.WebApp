Create PROCEDURE [dbo].[UserAccounts_Get] 
AS
Select 
[UserAccountID],
[UserAccountNo],
[fkUserID],
[Password],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

from 
UserAccounts
Return
