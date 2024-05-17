﻿Create PROCEDURE [dbo].[ItemSaleRateDiffs_Get] 
AS
Select 
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

from 
ItemSaleRateDiffs
Return