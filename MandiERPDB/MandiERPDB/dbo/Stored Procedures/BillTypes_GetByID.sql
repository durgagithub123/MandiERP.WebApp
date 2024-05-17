
CREATE PROCEDURE [dbo].[BillTypes_GetByID] 
	(
@BillTypeID int
)
AS
SELECT	 
[BillTypeID],
[BillTypeNo],
[BillType],
[IsChangesAllowonBill],
[IsShowonPage],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
BillTypes  
WHERE 
[BillTypeID]=@BillTypeID


RETURN
