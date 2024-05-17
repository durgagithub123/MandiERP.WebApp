Create PROCEDURE [dbo].[ItemWeightDetails_Get] 
AS
Select 
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

from 
ItemWeightDetails
Return
