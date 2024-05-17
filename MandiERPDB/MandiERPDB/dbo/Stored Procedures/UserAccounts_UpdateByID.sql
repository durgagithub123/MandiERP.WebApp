
CREATE PROCEDURE [dbo].[UserAccounts_UpdateByID] 
	(
@UserAccountID int,
@UserAccountNo int=null,
@fkUserID int=null,
@Password varchar(250),
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Update  UserAccounts Set 
[UserAccountNo]=@UserAccountNo,
[fkUserID]=@fkUserID,
[Password]=@Password,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[UserAccountID]=@UserAccountID


Return
