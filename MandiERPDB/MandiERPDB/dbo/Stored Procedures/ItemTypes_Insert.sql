
CREATE PROCEDURE [dbo].[ItemTypes_Insert] 
	(
@ItemTypeNo int=null,
@ItemName nvarchar(500)=null,
@ItemNameHindi nvarchar(500)=null,
@RateOfUnitinKGS int=null,
@PercentComission decimal=null,
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
ItemTypes 
(
[ItemTypeNo],
[ItemName],
[ItemNameHindi],
[RateOfUnitinKGS],
[PercentComission],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@ItemTypeNo,
@ItemName,
@ItemNameHindi,
@RateOfUnitinKGS,
@PercentComission,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
