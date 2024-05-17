
CREATE PROCEDURE [dbo].[ManageAccounts_UpdateByID] 
	(
@ManageAccountID bigint,
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
Update  ManageAccounts Set 
[ManageAccountNo]=@ManageAccountNo,
[fkAccountID]=@fkAccountID,
[fkAccountTypeID]=@fkAccountTypeID,
[IsShowonPage]=@IsShowonPage,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[ManageAccountID]=@ManageAccountID


Return
