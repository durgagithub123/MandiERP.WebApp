
CREATE PROCEDURE [dbo].[ItemWeightDetails_GetByID] 
	(
@ItemWeightDetailID int
)
AS
SELECT	 
[ItemWeightDetailID],
[ItemWeightDetailNo],
[fkBillDetailID],
[WeightinKGM],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
ItemWeightDetails  
WHERE 
[ItemWeightDetailID]=@ItemWeightDetailID


RETURN
