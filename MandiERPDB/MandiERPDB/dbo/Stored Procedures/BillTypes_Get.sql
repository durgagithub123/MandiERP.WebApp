Create PROCEDURE [dbo].[BillTypes_Get] 
AS
Select 
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

from 
BillTypes
Return
