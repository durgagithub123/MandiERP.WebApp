﻿
CREATE PROCEDURE [dbo].[ItemSaleRateDiffs_Insert] 
	(
@ItemSaleRateDiffNo bigint=null,
@ItemSaleRateDiffCode varchar(100)=null,
@ItemSaleRateDiffDetail varchar(100)=null,
@fkAccountID bigint=null,
@fkItemSaleDetailID bigint=null,
@IsCompanyAccount varchar(50)=null,
@fkBillDetailID bigint,
@Quantity decimal=null,
@Rate decimal=null,
@SaleTypeFixOrWeightBased nvarchar(50)=null,
@GrossWeight decimal=null,
@WeightDetails varchar(4000)=null,
@NetWeight decimal=null,
@CommissionPercent decimal=null,
@CommissionAmount decimal=null,
@TotalAmount decimal=null,
@NetAmount decimal=null,
@SQuantity decimal=null,
@SRate decimal=null,
@SSaleTypeFixOrWeightBased nvarchar(50)=null,
@SGrossWeight decimal=null,
@SWeightDetails varchar(4000)=null,
@SNetWeight decimal=null,
@SCommissionPercent decimal=null,
@SCommissionAmount decimal=null,
@STotalAmount decimal=null,
@SNetAmount decimal=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@fkBillID bigint=null,
@Sysdate datetime=null
)
AS
Insert Into 
ItemSaleRateDiffs 
(
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
) 
values(
@ItemSaleRateDiffNo,
@ItemSaleRateDiffCode,
@ItemSaleRateDiffDetail,
@fkAccountID,
@fkItemSaleDetailID,
@IsCompanyAccount,
@fkBillDetailID,
@Quantity,
@Rate,
@SaleTypeFixOrWeightBased,
@GrossWeight,
@WeightDetails,
@NetWeight,
@CommissionPercent,
@CommissionAmount,
@TotalAmount,
@NetAmount,
@SQuantity,
@SRate,
@SSaleTypeFixOrWeightBased,
@SGrossWeight,
@SWeightDetails,
@SNetWeight,
@SCommissionPercent,
@SCommissionAmount,
@STotalAmount,
@SNetAmount,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@fkBillID,
@Sysdate
)
RETURN Scope_identity()
