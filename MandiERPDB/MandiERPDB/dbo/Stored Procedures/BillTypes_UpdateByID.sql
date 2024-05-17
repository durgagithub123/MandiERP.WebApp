
CREATE PROCEDURE [dbo].[BillTypes_UpdateByID] 
	(
@BillTypeID int,
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
Update  BillTypes Set 
[BillTypeNo]=@BillTypeNo,
[BillType]=@BillType,
[IsChangesAllowonBill]=@IsChangesAllowonBill,
[IsShowonPage]=@IsShowonPage,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[BillTypeID]=@BillTypeID


Return
