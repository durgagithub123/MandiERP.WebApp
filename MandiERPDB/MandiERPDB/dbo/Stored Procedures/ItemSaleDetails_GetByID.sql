
CREATE PROCEDURE [dbo].[ItemSaleDetails_GetByID] 
	(
@ItemSaleDetailID bigint
)
AS
SELECT	 
[ItemSaleDetailID],
[ItemSaleDetailNo],
[ItemSaleCode],
[ItemSaleCodeDetail],
[fkAccountID],
[PhoneNo],
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
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[fkBillID],
[Remark],
[Comment],
[Sysdate]

FROM 
ItemSaleDetails  
WHERE 
[ItemSaleDetailID]=@ItemSaleDetailID


RETURN
