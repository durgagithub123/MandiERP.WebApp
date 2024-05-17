﻿Create PROCEDURE [dbo].[ItemSaleDetails_Get] 
AS
Select 
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

from 
ItemSaleDetails
Return