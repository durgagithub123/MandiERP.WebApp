
CREATE PROCEDURE [dbo].[BranchMasters_UpdateByID] 
	(
@BranchID int,
@BranchNo int=null,
@BranchName varchar(50)=null,
@BranchDetail varchar(50)=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Update  BranchMasters Set 
[BranchNo]=@BranchNo,
[BranchName]=@BranchName,
[BranchDetail]=@BranchDetail,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[BranchID]=@BranchID


Return
