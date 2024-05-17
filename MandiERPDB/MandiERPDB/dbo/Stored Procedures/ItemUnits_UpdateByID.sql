
CREATE PROCEDURE [dbo].[ItemUnits_UpdateByID] 
	(
@ItemUnitID int,
@ItemUnitNo int=null,
@ItemUnit nvarchar(500)=null,
@ItemUnitHindi nvarchar(500)=null,
@RateOfUnitinKGS int=null,
@PercentComission decimal=null,
@WeightCuttingPerUnit decimal=null,
@HammaliPerUnit decimal=null,
@TulaiPerUnit decimal=null,
@KhadiKariPerUnit decimal=null,
@WeightCuttingPerUnit1 decimal=null,
@HammaliPerUnit1 decimal=null,
@TulaiPerUnit1 decimal=null,
@KhadiKariPerUnit1 decimal=null,
@WeightCuttingPerUnit2 decimal=null,
@HammaliPerUnit2 decimal=null,
@TulaiPerUnit2 decimal=null,
@KhadiKariPerUnit2 decimal=null,
@WeightCuttingPerUnit4 decimal=null,
@HammaliPerUnit4 decimal=null,
@TulaiPerUnit4 decimal=null,
@KhadiKariPerUnit4 decimal=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Update  ItemUnits Set 
[ItemUnitNo]=@ItemUnitNo,
[ItemUnit]=@ItemUnit,
[ItemUnitHindi]=@ItemUnitHindi,
[RateOfUnitinKGS]=@RateOfUnitinKGS,
[PercentComission]=@PercentComission,
[WeightCuttingPerUnit]=@WeightCuttingPerUnit,
[HammaliPerUnit]=@HammaliPerUnit,
[TulaiPerUnit]=@TulaiPerUnit,
[KhadiKariPerUnit]=@KhadiKariPerUnit,
[WeightCuttingPerUnit1]=@WeightCuttingPerUnit1,
[HammaliPerUnit1]=@HammaliPerUnit1,
[TulaiPerUnit1]=@TulaiPerUnit1,
[KhadiKariPerUnit1]=@KhadiKariPerUnit1,
[WeightCuttingPerUnit2]=@WeightCuttingPerUnit2,
[HammaliPerUnit2]=@HammaliPerUnit2,
[TulaiPerUnit2]=@TulaiPerUnit2,
[KhadiKariPerUnit2]=@KhadiKariPerUnit2,
[WeightCuttingPerUnit4]=@WeightCuttingPerUnit4,
[HammaliPerUnit4]=@HammaliPerUnit4,
[TulaiPerUnit4]=@TulaiPerUnit4,
[KhadiKariPerUnit4]=@KhadiKariPerUnit4,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[ItemUnitID]=@ItemUnitID


Return
