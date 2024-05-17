Create PROCEDURE [dbo].[ItemTypes_Get] 
AS
Select 
[ItemTypeID],
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

from 
ItemTypes
Return
