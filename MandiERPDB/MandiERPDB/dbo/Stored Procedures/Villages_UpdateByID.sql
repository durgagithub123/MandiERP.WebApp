
CREATE PROCEDURE [dbo].[Villages_UpdateByID] 
	(
@VillageID bigint,
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
Update  Villages Set 
[VillageNo]=@VillageNo,
[VillageName]=@VillageName,
[VillageNameHindi]=@VillageNameHindi,
[State]=@State,
[Zip]=@Zip,
[Address]=@Address,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[VillageID]=@VillageID


Return
