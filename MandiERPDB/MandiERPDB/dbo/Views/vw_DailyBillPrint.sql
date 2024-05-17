CREATE view [dbo].[vw_DailyBillPrint]
as

SELECT     BillNo, IsBillPrint, BillPaidStatus, BillDate, TransPortName, GadiNo, ItemName, ItemUnit, ItemMarca, Quantity, BillRate, CommissionAmount, BillGrossWeight, 
                      BillNetWeight, WeightDetails, TotalHammali, TotalTulai, TotalKhadiKari, BillTotalAmount, ActualTotalAmount, Sevasulk, Innam, CashAdvace, Stationery, Postage, 
                      Other, TotalWeightCutting, VillageName, NetWeight, AccountName, AccountID
                      ,ISNULL( TotalHammali,0)+ ISNULL(TotalTulai,0) AS TotalHammaliTulai
                      ,isnull(ActualTotalAmount,0) - (ISNULL( TotalHammali,0)+ ISNULL(TotalTulai,0)) as NetBillAmount
FROM         vw_BillDetail
