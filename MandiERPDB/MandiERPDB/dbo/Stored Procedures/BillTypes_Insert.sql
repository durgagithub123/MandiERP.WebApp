
CREATE PROCEDURE [dbo].[BillTypes_Insert] 
	(
@BillTypeNo int=null,
@BillType nvarchar(500),
@IsChangesAllowonBill varchar(20)=null,
@IsShowonPage varchar(10)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Insert Into 
BillTypes 
(
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
) 
values(
@BillTypeNo,
@BillType,
@IsChangesAllowonBill,
@IsShowonPage,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
