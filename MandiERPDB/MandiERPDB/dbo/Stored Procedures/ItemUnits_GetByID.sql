﻿
CREATE PROCEDURE [dbo].[ItemUnits_GetByID] 
	(
@ItemUnitID int
)
AS
SELECT	 
[ItemUnitID],
[ItemUnitNo],
[ItemUnit],
[ItemUnitHindi],
[RateOfUnitinKGS],
[PercentComission],
[WeightCuttingPerUnit],
[HammaliPerUnit],
[TulaiPerUnit],
[KhadiKariPerUnit],
[WeightCuttingPerUnit1],
[HammaliPerUnit1],
[TulaiPerUnit1],
[KhadiKariPerUnit1],
[WeightCuttingPerUnit2],
[HammaliPerUnit2],
[TulaiPerUnit2],
[KhadiKariPerUnit2],
[WeightCuttingPerUnit4],
[HammaliPerUnit4],
[TulaiPerUnit4],
[KhadiKariPerUnit4],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
ItemUnits  
WHERE 
[ItemUnitID]=@ItemUnitID


RETURN
