
CREATE PROCEDURE [dbo].[AccountTypes_UpdateByID] 
	(
@AccountTypeID int,
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
Update  AccountTypes Set 
[AccountTypeNo]=@AccountTypeNo,
[AccountCode]=@AccountCode,
[AccountTypeName]=@AccountTypeName,
[AccountType]=@AccountType,
[AccountTypeDetail]=@AccountTypeDetail,
[Comment]=@Comment,
[SubHeadDetail]=@SubHeadDetail,
[IsBalanceKhata]=@IsBalanceKhata,
[IsShowonPage]=@IsShowonPage,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[AccountTypeID]=@AccountTypeID


Return
