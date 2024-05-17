CREATE VIEW [dbo].[vw_RateDiffBillSale1]
AS
SELECT     dbo.vw_panadetails.FarmerShortName, dbo.vw_panadetails.FarmerName, dbo.vw_panadetails.AccountFirmName, dbo.vw_panadetails.AccountName, 
                      dbo.vw_panadetails.AccountMobileNo, dbo.vw_panadetails.Rate AS ItemSaleRate, dbo.vw_panadetails.Quantity AS ItemSaleQuantity, 
                      dbo.vw_panadetails.GrossWeight AS ItemSaleGrossWeight, dbo.vw_panadetails.WeightDetails AS ItemSaleWeightDetails, 
                      dbo.vw_panadetails.NetWeight AS ItemSaleNetWeight, dbo.vw_panadetails.CommissionPercent AS ItemSaleCommissionPercent, 
                      dbo.vw_panadetails.CommissionAmount AS ItemSaleCommissionAmount, dbo.vw_panadetails.TotalAmount AS ItemSaleTotalAmount, 
                      dbo.vw_panadetails.NetTotalAmount AS ItemSaleNetTotalAmount, dbo.vw_panadetails.ItemName, dbo.vw_panadetails.IsPurchaser, dbo.vw_panadetails.VillageName, 
                      dbo.vw_panadetails.ActualTotalAmount AS ItemSaleActualTotalAmount, dbo.vw_BillDetail.Quantity, dbo.vw_BillDetail.BillRate, dbo.vw_BillDetail.BillGrossWeight, 
                      dbo.vw_BillDetail.BillNetWeight, dbo.vw_BillDetail.WeightDetails, dbo.vw_BillDetail.TotalHammali, dbo.vw_BillDetail.TotalTulai, dbo.vw_BillDetail.TotalKhadiKari, 
                      dbo.vw_BillDetail.BillTotalAmount, dbo.vw_BillDetail.ActualTotalAmount, dbo.vw_BillDetail.TotalWeightCutting, dbo.vw_BillDetail.CashAdvace, 
                      dbo.vw_BillDetail.Sevasulk, dbo.vw_BillDetail.Innam, dbo.vw_BillDetail.Stationery, dbo.vw_BillDetail.Postage, dbo.vw_BillDetail.Other, 
                      dbo.vw_panadetails.BillDate
FROM         dbo.vw_BillDetail INNER JOIN
                      dbo.vw_panadetails ON dbo.vw_BillDetail.BillDetailID = dbo.vw_panadetails.fkBillDetailID
where dbo.vw_panadetails.IsActive!='0'

