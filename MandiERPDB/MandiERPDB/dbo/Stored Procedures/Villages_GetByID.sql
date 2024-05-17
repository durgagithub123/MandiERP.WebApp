
CREATE PROCEDURE [dbo].[Villages_GetByID] 
	(
@VillageID bigint
)
AS
SELECT	 
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

FROM 
Villages  
WHERE 
[VillageID]=@VillageID


RETURN
