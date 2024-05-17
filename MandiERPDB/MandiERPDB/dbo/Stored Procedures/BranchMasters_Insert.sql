
CREATE PROCEDURE [dbo].[BranchMasters_Insert] 
	(
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
Insert Into 
BranchMasters 
(
[BranchNo],
[BranchName],
[BranchDetail],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@BranchNo,
@BranchName,
@BranchDetail,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
