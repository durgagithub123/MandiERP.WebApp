Create PROCEDURE [dbo].[AccountTypes_Get] 
AS
Select 
[AccountTypeID],
[AccountTypeNo],
[AccountCode],
[AccountTypeName],
[AccountType],
[AccountTypeDetail],
[Comment],
[SubHeadDetail],
[IsBalanceKhata],
[IsShowonPage],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

from 
AccountTypes
Return
