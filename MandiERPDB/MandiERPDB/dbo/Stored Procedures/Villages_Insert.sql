
CREATE PROCEDURE [dbo].[Villages_Insert] 
	(
@VillageNo bigint=null,
@VillageName nvarchar(250),
@VillageNameHindi nvarchar(250)=null,
@State nvarchar(250)=null,
@Zip nvarchar(250)=null,
@Address nvarchar(1000)=null,
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
Villages 
(
[VillageNo],
[VillageName],
[VillageNameHindi],
[State],
[Zip],
[Address],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@VillageNo,
@VillageName,
@VillageNameHindi,
@State,
@Zip,
@Address,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
