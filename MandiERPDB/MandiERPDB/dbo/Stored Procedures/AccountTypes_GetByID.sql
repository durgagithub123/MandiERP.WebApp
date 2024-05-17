
CREATE PROCEDURE [dbo].[AccountTypes_GetByID] 
	(
@AccountTypeID int
)
AS
SELECT	 
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

FROM 
AccountTypes  
WHERE 
[AccountTypeID]=@AccountTypeID


RETURN
