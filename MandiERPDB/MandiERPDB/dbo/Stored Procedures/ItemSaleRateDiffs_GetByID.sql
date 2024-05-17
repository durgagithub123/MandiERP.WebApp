
CREATE PROCEDURE [dbo].[ItemSaleRateDiffs_GetByID] 
	(
@ItemSaleRateDiffID bigint
)
AS
SELECT	 
[ItemSaleRateDiffID],
[ItemSaleRateDiffNo],
[ItemSaleRateDiffCode],
[ItemSaleRateDiffDetail],
[fkAccountID],
[fkItemSaleDetailID],
[IsCompanyAccount],
[fkBillDetailID],
[Quantity],
[Rate],
[SaleTypeFixOrWeightBased],
[GrossWeight],
[WeightDetails],
[NetWeight],
[CommissionPercent],
[CommissionAmount],
[TotalAmount],
[NetAmount],
[SQuantity],
[SRate],
[SSaleTypeFixOrWeightBased],
[SGrossWeight],
[SWeightDetails],
[SNetWeight],
[SCommissionPercent],
[SCommissionAmount],
[STotalAmount],
[SNetAmount],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[fkBillID],
[Sysdate]

FROM 
ItemSaleRateDiffs  
WHERE 
[ItemSaleRateDiffID]=@ItemSaleRateDiffID


RETURN
