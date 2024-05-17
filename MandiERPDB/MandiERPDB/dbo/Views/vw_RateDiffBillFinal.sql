CREATE VIEW [dbo].[vw_RateDiffBillFinal]
AS
SELECT     FarmerName, AccountFirmName, AccountName, ItemSaleRate, BillRate, Quantity, ItemSaleQuantity, ItemSaleGrossWeight, ItemSaleWeightDetails, 
                      ItemSaleNetWeight, ItemSaleCommissionPercent, ItemSaleCommissionAmount, ItemSaleTotalAmount, ItemSaleNetTotalAmount, ItemName, BillGrossWeight, 
                      BillNetWeight, WeightDetails, TotalHammali, TotalTulai, TotalKhadiKari, BillTotalAmount, ActualTotalAmount, TotalWeightCutting, CashAdvace, Sevasulk, Innam, 
                      Stationery, Postage, Other, BillDate
FROM         dbo.vw_RateDiffBillSale
