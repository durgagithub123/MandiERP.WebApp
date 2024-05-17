CREATE VIEW [dbo].[vw_ExportItem_old]
AS
SELECT     vw_Exports.ItemSaleDetailID, vw_Exports.Quantity, vw_Exports.Rate, vw_Exports.PhoneNo, vw_Exports.fkAccountID, vw_Exports.AccountID, vw_Exports.AccountFirmName, 
                      vw_Exports.AccountSortName, vw_Exports.AccountName, vw_Exports.SaleTypeFixOrWeightBased, vw_Exports.GrossWeight, vw_Exports.WeightDetails, vw_Exports.NetWeight, 
                      vw_Exports.AccountSortName + ' ' + CONVERT(varchar(20), vw_Exports.ItemName) + ' ' + ' ' + CONVERT(varchar(20), vw_Exports.Quantity) + ' ' + CONVERT(varchar(20), vw_Exports.Rate) 
                      + ' ' + CONVERT(varchar(20), vw_Exports.TotalAmount) AS Item, vw_Exports.TotalAmount, vw_Exports.CommissionAmount, vw_Exports.CommissionPercent, vw_Exports.ItemMarca, 
                      vw_Exports.ItemUnit, vw_Exports.PartyName, vw_Exports.ItemName, vw_Exports.fkItemTypeID, ItemUnits.ItemUnit AS UnitName, vw_Exports.RemainQty, ItemUnits.HammaliPerUnit2, 
                      ItemUnits.TulaiPerUnit2, vw_Exports.CreateDate
FROM         vw_Exports INNER JOIN
                      ItemUnits ON vw_Exports.ItemUnit = ItemUnits.ItemUnitID
                      
where CONVERT(varchar(10),vw_Exports.CreateDate,112) > 20150207
