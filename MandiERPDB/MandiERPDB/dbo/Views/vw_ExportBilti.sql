CREATE VIEW [dbo].[vw_ExportBilti]
AS
SELECT ExportMasters.ExportMasterID
	,ExportMasters.ExportMasterNo
	,ExportItemDetails.ExportItemDetailID
	,ExportMasters.ClientName
	,ExportItemDetails.fkItemSaleDetailID
	,ExportMasters.ClientCity
	,ExportItemDetails.AcutualQuantity
	,ExportItemDetails.Marca
	,ExportItemDetails.ActualRate
	,ItemSaleDetails.Rate
	,ExportItemDetails.GrossWeight
	,ExportItemDetails.NetWeight
	,ExportItemDetails.TotalAmount
	,ExportItemDetails.CommissionAmount
	,ExportItemDetails.TotalHammali
	,ExportItemDetails.TotalTulai
	,ExportItemDetails.TotalKhadiKari
	,ExportItemDetails.NetAmount
	,ExportItemDetails.TotalCarat
	,ExportItemDetails.TotalCatte
	,ExportItemDetails.TotalBhada
	,ExportMasters.DriverName
	,ExportMasters.DriverPhoneNo
	,ExportMasters.DriverInam
	,ExportMasters.GadiBhada
	,ExportMasters.AdvanceBhada
	,ExportMasters.RemainingBhada
	,ExportMasters.ReachDate
	,ExportMasters.TimeToReach
	,ExportMasters.PerKattaBhada
	,ExportMasters.PerCaratBhada
	,ExportMasters.ParBoriBhada
	,ExportMasters.FakeMandiAmount
	,ExportMasters.FakeMandiPercent
	,ExportMasters.FakeMandiNetAmount
	,ExportMasters.TotalExportAmount
	,ExportMasters.TotalBillExportAmount
	,ExportMasters.TotalExpenses
	,ExportMasters.BillTotalExpenses
	,ExportMasters.NetExportAmount
	,Accounts.AccountID
	,ExportMasters.fkAccountID
	,Accounts.AccountFirmName AS ClientFirmName
	,Accounts.AccountName
	,Accounts.AccountSortName AS ClientShortName
	,ExportMasters.BiltiDate
	,ExportItemDetails.ItemName
	,ExportItemDetails.UnitName
	,ExportMasters.GadiNo
	,ExportMasters.TotalHammali AS TotalHammaliText
	,ExportMasters.MandiSulk
	,ItemSaleDetails.CommissionAmount AS ItemCommissionAmount
	,ExportCode
	,ExportCodeDetail
	,ItemSaleDetails.fkBillDetailID
	,ItemSaleDetails.fkBillID
FROM ExportMasters
INNER JOIN ExportItemDetails ON ExportMasters.ExportMasterID = ExportItemDetails.fkExportMasterID
INNER JOIN Accounts ON ExportMasters.fkAccountID = Accounts.AccountID
INNER JOIN ItemSaleDetails ON ExportItemDetails.fkItemSaleDetailID = ItemSaleDetails.ItemSaleDetailID
