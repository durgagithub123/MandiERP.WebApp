Create PROCEDURE [dbo].[Villages_Get] 
AS
Select 
[VillageID],
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

from 
Villages
Return
