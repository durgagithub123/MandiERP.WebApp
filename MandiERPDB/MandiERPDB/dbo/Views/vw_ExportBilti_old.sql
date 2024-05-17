CREATE VIEW [dbo].[vw_ExportBilti_old]
AS
SELECT     dbo.ExportMasters.ExportMasterID, dbo.ExportItemDetails.ExportItemDetailID, dbo.ExportMasters.ClientName, dbo.ExportItemDetails.fkItemSaleDetailID, dbo.ExportMasters.ClientCity, 
                      dbo.ExportItemDetails.AcutualQuantity, dbo.ExportItemDetails.Marca, dbo.ExportItemDetails.ActualRate, dbo.ExportItemDetails.GrossWeight, dbo.ExportItemDetails.NetWeight, 
                      dbo.ExportItemDetails.TotalAmount, dbo.ExportItemDetails.CommissionAmount, dbo.ExportItemDetails.TotalHammali, dbo.ExportItemDetails.TotalTulai, dbo.ExportItemDetails.TotalKhadiKari, 
                      dbo.ExportItemDetails.NetAmount, dbo.ExportItemDetails.TotalCarat, dbo.ExportItemDetails.TotalCatte, dbo.ExportItemDetails.TotalBhada, dbo.ExportMasters.DriverName, 
                      dbo.ExportMasters.DriverPhoneNo, dbo.ExportMasters.DriverInam, dbo.ExportMasters.GadiBhada, dbo.ExportMasters.AdvanceBhada, dbo.ExportMasters.RemainingBhada, 
                      dbo.ExportMasters.ReachDate, dbo.ExportMasters.TimeToReach, dbo.ExportMasters.PerKattaBhada, dbo.ExportMasters.PerCaratBhada, dbo.ExportMasters.ParBoriBhada, 
                      dbo.ExportMasters.FakeMandiAmount, dbo.ExportMasters.FakeMandiPercent, dbo.ExportMasters.FakeMandiNetAmount, dbo.ExportMasters.TotalExportAmount, 
                      dbo.ExportMasters.TotalBillExportAmount, dbo.ExportMasters.TotalExpenses, dbo.ExportMasters.BillTotalExpenses, dbo.ExportMasters.NetExportAmount, dbo.Accounts.AccountID, 
                      dbo.ExportMasters.fkAccountID, dbo.Accounts.AccountFirmName AS ClientFirmName, dbo.Accounts.AccountName, dbo.Accounts.AccountSortName AS ClientShortName, dbo.ExportMasters.BiltiDate, 
                      dbo.ExportItemDetails.ItemName, dbo.ExportItemDetails.UnitName, dbo.ExportMasters.GadiNo, dbo.ExportMasters.TotalHammali AS TotalHammaliText, dbo.ExportMasters.MandiSulk
FROM         dbo.ExportMasters INNER JOIN
                      dbo.ExportItemDetails ON dbo.ExportMasters.ExportMasterID = dbo.ExportItemDetails.fkExportMasterID INNER JOIN
                      dbo.Accounts ON dbo.ExportMasters.fkAccountID = dbo.Accounts.AccountID

