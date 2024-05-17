
CREATE PROCEDURE [dbo].[ItemTypes_GetByID] 
	(
@ItemTypeID int
)
AS
SELECT	 
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

FROM 
ItemTypes  
WHERE 
[ItemTypeID]=@ItemTypeID


RETURN
