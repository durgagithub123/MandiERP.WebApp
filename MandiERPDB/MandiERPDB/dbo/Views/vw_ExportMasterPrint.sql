CREATE VIEW [dbo].[vw_ExportMasterPrint]
AS
SELECT     dbo.vw_ExportBilti.ExportMasterID, dbo.vw_ExportBilti.ExportMasterNo, dbo.vw_ExportBilti.ExportItemDetailID, dbo.vw_ExportBilti.ClientName, dbo.vw_ExportBilti.fkItemSaleDetailID, 
                      dbo.vw_ExportBilti.fkAccountID, dbo.vw_ExportBilti.ClientCity, dbo.vw_ExportBilti.AcutualQuantity, dbo.vw_ExportBilti.Marca, dbo.vw_ExportBilti.ActualRate, dbo.vw_ExportBilti.Rate, 
                      dbo.vw_ExportBilti.GrossWeight, dbo.vw_ExportBilti.NetWeight, dbo.vw_ExportBilti.TotalAmount, dbo.vw_ExportBilti.CommissionAmount, dbo.vw_ExportBilti.TotalHammali, 
                      dbo.vw_ExportBilti.TotalTulai, dbo.vw_ExportBilti.TotalKhadiKari, dbo.vw_ExportBilti.NetAmount, dbo.vw_ExportBilti.TotalCarat, dbo.vw_ExportBilti.TotalCatte, dbo.vw_ExportBilti.TotalBhada, 
                      dbo.vw_ExportBilti.DriverName, dbo.vw_ExportBilti.DriverPhoneNo, dbo.vw_ExportBilti.DriverInam, dbo.vw_ExportBilti.GadiBhada, dbo.vw_ExportBilti.AdvanceBhada, 
                      dbo.vw_ExportBilti.RemainingBhada, dbo.vw_ExportBilti.ReachDate, dbo.vw_ExportBilti.TimeToReach, dbo.vw_ExportBilti.PerKattaBhada, dbo.vw_ExportBilti.PerCaratBhada, 
                      dbo.vw_ExportBilti.ParBoriBhada, dbo.vw_ExportBilti.FakeMandiAmount, dbo.vw_ExportBilti.FakeMandiPercent, dbo.vw_ExportBilti.FakeMandiNetAmount, dbo.vw_ExportBilti.TotalExportAmount, 
                      dbo.vw_ExportBilti.TotalBillExportAmount, dbo.vw_ExportBilti.TotalExpenses, dbo.vw_ExportBilti.BillTotalExpenses, dbo.vw_ExportBilti.NetExportAmount, dbo.vw_ExportBilti.ClientFirmName, 
                      dbo.vw_ExportBilti.ClientShortName, CONVERT(VARCHAR(10), dbo.vw_ExportBilti.BiltiDate, 103) AS BiltiDate, dbo.vw_ExportBilti.BiltiDate AS BiltiDateActual, dbo.vw_ExportBilti.ItemName, 
                      dbo.vw_ExportBilti.UnitName, dbo.vw_ExportBilti.GadiNo, dbo.vw_ExportBilti.TotalHammaliText, dbo.vw_ExportBilti.MandiSulk, dbo.vw_panadetails.FarmerName AS FN1, 
                      dbo.fun_getFarmerNameByItemSaleDetailID(dbo.vw_panadetails.ItemSaleDetailID, 'FULL') AS FarmerName, dbo.vw_panadetails.FarmerShortName, dbo.vw_panadetails.fkBillDetailID, 
                      dbo.vw_panadetails.ItemSaleDetailID, dbo.vw_ExportBilti.AccountName, dbo.vw_ExportBilti.ItemCommissionAmount, dbo.vw_ExportBilti.ExportCode, dbo.vw_ExportBilti.ExportCodeDetail, 
                      0.00 AS OpeningBalance, 0.00 AS TodaysCreditDebit, 0.00 AS ClosingBalance
FROM         dbo.vw_ExportBilti INNER JOIN
                      dbo.vw_panadetails ON dbo.vw_ExportBilti.fkItemSaleDetailID = dbo.vw_panadetails.ItemSaleDetailID
