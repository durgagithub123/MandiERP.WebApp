
CREATE PROCEDURE [dbo].[ItemTypes_UpdateByID] 
	(
@ItemTypeID int,
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
Update  ItemTypes Set 
[ItemTypeNo]=@ItemTypeNo,
[ItemName]=@ItemName,
[ItemNameHindi]=@ItemNameHindi,
[RateOfUnitinKGS]=@RateOfUnitinKGS,
[PercentComission]=@PercentComission,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[ItemTypeID]=@ItemTypeID


Return
