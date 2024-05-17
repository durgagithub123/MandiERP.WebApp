
CREATE PROCEDURE [dbo].[AccountTypes_Insert] 
	(
@AccountTypeNo int=null,
@AccountCode varchar(50)=null,
@AccountTypeName varchar(50)=null,
@AccountType varchar(20)=null,
@AccountTypeDetail varchar(50)=null,
@Comment varchar(500)=null,
@SubHeadDetail varchar(50)=null,
@IsBalanceKhata varchar(50)=null,
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
AccountTypes 
(
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
) 
values(
@AccountTypeNo,
@AccountCode,
@AccountTypeName,
@AccountType,
@AccountTypeDetail,
@Comment,
@SubHeadDetail,
@IsBalanceKhata,
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
