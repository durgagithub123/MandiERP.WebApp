CREATE VIEW [dbo].[vw_ExportBiltiFinalOld]
AS
SELECT     dbo.vw_BillDetail_ExportBilti.ItemSaleDetailID, dbo.vw_ExportBilti.ExportMasterID, dbo.vw_ExportBilti.ExportItemDetailID, dbo.vw_ExportBilti.ClientName, 
                      dbo.vw_ExportBilti.fkItemSaleDetailID, dbo.vw_ExportBilti.fkAccountID, dbo.vw_ExportBilti.ClientCity, dbo.vw_ExportBilti.AcutualQuantity, dbo.vw_ExportBilti.Marca, 
                      dbo.vw_ExportBilti.ActualRate, dbo.vw_ExportBilti.GrossWeight, dbo.vw_ExportBilti.NetWeight, dbo.vw_ExportBilti.TotalAmount, 
                      dbo.vw_ExportBilti.CommissionAmount, dbo.vw_ExportBilti.TotalHammali, dbo.vw_ExportBilti.TotalTulai, dbo.vw_ExportBilti.TotalKhadiKari, 
                      dbo.vw_ExportBilti.NetAmount, dbo.vw_ExportBilti.TotalCarat, dbo.vw_ExportBilti.TotalCatte, dbo.vw_ExportBilti.TotalBhada, dbo.vw_ExportBilti.DriverName, 
                      dbo.vw_ExportBilti.DriverPhoneNo, dbo.vw_ExportBilti.DriverInam, dbo.vw_ExportBilti.GadiBhada, dbo.vw_ExportBilti.AdvanceBhada, 
                      dbo.vw_ExportBilti.RemainingBhada, dbo.vw_ExportBilti.ReachDate, dbo.vw_ExportBilti.TimeToReach, dbo.vw_ExportBilti.PerKattaBhada, 
                      dbo.vw_ExportBilti.PerCaratBhada, dbo.vw_ExportBilti.ParBoriBhada, dbo.vw_ExportBilti.FakeMandiAmount, dbo.vw_ExportBilti.FakeMandiPercent, 
                      dbo.vw_ExportBilti.FakeMandiNetAmount, dbo.vw_ExportBilti.TotalExportAmount, dbo.vw_ExportBilti.TotalBillExportAmount, dbo.vw_ExportBilti.TotalExpenses, 
                      dbo.vw_ExportBilti.BillTotalExpenses, dbo.vw_ExportBilti.NetExportAmount, dbo.vw_BillDetail_ExportBilti.AccountName,convert(varchar(10), dbo.vw_ExportBilti.BiltiDate,103) as BiltiDate
                      ,dbo.vw_ExportBilti.BiltiDate as BiltiDateActual
FROM         dbo.vw_BillDetail_ExportBilti INNER JOIN
                      dbo.vw_ExportBilti ON dbo.vw_BillDetail_ExportBilti.ItemSaleDetailID = dbo.vw_ExportBilti.fkItemSaleDetailID
