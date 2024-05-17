CREATE VIEW [dbo].[vw_ExportItem]
AS
SELECT     dbo.vw_Exports.ItemSaleDetailID, dbo.vw_Exports.Quantity, dbo.vw_Exports.Rate, dbo.vw_Exports.PhoneNo, dbo.vw_Exports.fkAccountID, dbo.vw_Exports.AccountID, 
                      dbo.vw_Exports.AccountFirmName, dbo.vw_Exports.AccountSortName, dbo.vw_Exports.AccountName, dbo.vw_Exports.SaleTypeFixOrWeightBased, dbo.vw_Exports.GrossWeight, 
                      dbo.vw_Exports.WeightDetails, dbo.vw_Exports.NetWeight, dbo.vw_Exports.FarmerName + ' ' + CONVERT(varchar(20), dbo.vw_Exports.ItemName) + ' ' + ' ' + CONVERT(varchar(20), 
                      dbo.vw_Exports.Quantity) + ' ' + CONVERT(varchar(20), dbo.vw_Exports.Rate) + ' ' + CONVERT(varchar(20), dbo.vw_Exports.TotalAmount) AS Item, dbo.vw_Exports.TotalAmount, 
                      dbo.vw_Exports.CommissionAmount, dbo.vw_Exports.CommissionPercent, dbo.vw_Exports.ItemMarca, dbo.vw_Exports.ItemUnit, dbo.vw_Exports.PartyName, dbo.vw_Exports.ItemName, 
                      dbo.vw_Exports.fkItemTypeID, dbo.ItemUnits.ItemUnit AS UnitName, dbo.vw_Exports.RemainQty, dbo.ItemUnits.HammaliPerUnit2, dbo.ItemUnits.TulaiPerUnit2, dbo.vw_Exports.CreateDate, 
                      dbo.vw_Exports.ItemDate, dbo.vw_Exports.FarmerName
FROM         dbo.vw_Exports INNER JOIN
                      dbo.ItemUnits ON dbo.vw_Exports.ItemUnit = dbo.ItemUnits.ItemUnitID