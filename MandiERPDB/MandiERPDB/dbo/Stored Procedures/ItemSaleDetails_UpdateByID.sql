
CREATE PROCEDURE [dbo].[ItemSaleDetails_UpdateByID] 
	(
@ItemSaleDetailID bigint,
@ItemSaleDetailNo bigint=null,
@ItemSaleCode varchar(100)=null,
@ItemSaleCodeDetail varchar(100)=null,
@fkAccountID bigint=null,
@PhoneNo varchar(50)=null,
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
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@fkBillID bigint=null,
@Remark varchar=null,
@Comment varchar=null,
@Sysdate datetime=null
)
AS
Update  ItemSaleDetails Set 
[ItemSaleDetailNo]=@ItemSaleDetailNo,
[ItemSaleCode]=@ItemSaleCode,
[ItemSaleCodeDetail]=@ItemSaleCodeDetail,
[fkAccountID]=@fkAccountID,
[PhoneNo]=@PhoneNo,
[IsCompanyAccount]=@IsCompanyAccount,
[fkBillDetailID]=@fkBillDetailID,
[Quantity]=@Quantity,
[Rate]=@Rate,
[SaleTypeFixOrWeightBased]=@SaleTypeFixOrWeightBased,
[GrossWeight]=@GrossWeight,
[WeightDetails]=@WeightDetails,
[NetWeight]=@NetWeight,
[CommissionPercent]=@CommissionPercent,
[CommissionAmount]=@CommissionAmount,
[TotalAmount]=@TotalAmount,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[fkBillID]=@fkBillID,
[Remark]=@Remark,
[Comment]=@Comment,
[Sysdate]=@Sysdate
 
where 
[ItemSaleDetailID]=@ItemSaleDetailID


Return
