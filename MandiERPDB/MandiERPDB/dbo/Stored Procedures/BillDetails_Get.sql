﻿Create PROCEDURE [dbo].[BillDetails_Get] 
AS
Select 
[BillDetailID],
[BillDetailNo],
[BillDetailCode],
[fkBillID],
[SNo],
[fkItemTypeID],
[ItemName],
[fkItemUnitID],
[ItemUnit],
[ItemMarca],
[Quantity],
[ActualRate],
[BillRate],
[WeightDetails],
[BillWeightDetails],
[GrossWeight],
[BillGrossWeight],
[NetWeight],
[BillNetWeight],
[SaleTypeFixOrWeightBased],
[CommissionAmount],
[TotalWeightCutting],
[TotalHammali],
[TotalTulai],
[TotalKhadiKari],
[ActualTotalAmount],
[BillTotalAmount],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[CommissionPercent],
[Sysdate],
[AvgWeight],
[CommissionPercentS],
[CommissionAmountS],
[AvgRate]

from 
BillDetails
Return
