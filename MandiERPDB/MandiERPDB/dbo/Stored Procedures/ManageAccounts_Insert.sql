
CREATE PROCEDURE [dbo].[ManageAccounts_Insert] 
	(
@ManageAccountNo bigint=null,
@fkAccountID bigint=null,
@fkAccountTypeID int=null,
@IsShowonPage varchar(10)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@Sysdate datetime=null
)
AS
Insert Into 
ManageAccounts 
(
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
) 
values(
@ManageAccountNo,
@fkAccountID,
@fkAccountTypeID,
@IsShowonPage,
@fkBranchID,
@IsActive,
@InsertDate,
@ModifyDate,
@CreatedBy,
@ModifiedBy,
@Sysdate
)
RETURN Scope_identity()
