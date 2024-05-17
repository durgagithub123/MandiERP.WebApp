CREATE VIEW [dbo].[vw_ExportsOld]
AS
SELECT     dbo.ItemSaleDetails.ItemSaleDetailID, dbo.ItemSaleDetails.Quantity, dbo.ItemSaleDetails.Rate, dbo.ItemSaleDetails.PhoneNo, dbo.ItemSaleDetails.fkAccountID, dbo.Accounts.AccountID, 
                      dbo.Accounts.AccountFirmName, dbo.Accounts.AccountSortName, dbo.Accounts.AccountName, dbo.ItemSaleDetails.SaleTypeFixOrWeightBased, dbo.ItemSaleDetails.GrossWeight, 
                      dbo.ItemSaleDetails.WeightDetails, dbo.ItemSaleDetails.NetWeight, dbo.ItemSaleDetails.CommissionAmount, dbo.ItemSaleDetails.CommissionPercent, dbo.ItemSaleDetails.TotalAmount, 
                      dbo.ExportItemDetails.ExportItemDetailID, dbo.ExportItemDetails.fkItemSaleDetailID, dbo.ExportItemDetails.IsCompanyAccount, dbo.ExportItemDetails.PartyName, 
                      dbo.ExportItemDetails.TotalQuantity, dbo.ExportItemDetails.AcutualQuantity, dbo.ExportItemDetails.BillQuantity, dbo.ExportItemDetails.ActualRate, dbo.ExportItemDetails.BillRate, 
                      dbo.ExportItemDetails.GrossWeight AS Expr1, dbo.ExportItemDetails.BillGrossWeight, dbo.ExportItemDetails.NetWeight AS Expr2, dbo.ExportItemDetails.BillNetWeight, 
                      dbo.ExportItemDetails.TotalAmount AS Expr3, dbo.ExportItemDetails.BillTotalAmount, dbo.ExportItemDetails.CommissionPercent AS Expr4, dbo.ExportItemDetails.BillCommissionPercent, 
                      dbo.ExportItemDetails.CommissionAmount AS Expr5, dbo.ExportItemDetails.BillCommissionAmount, dbo.ExportItemDetails.TotalHammali, dbo.ExportItemDetails.TotalTulai, 
                      dbo.ExportItemDetails.TotalKhadiKari, dbo.ExportItemDetails.NetAmount, dbo.ExportItemDetails.BillNetAmount, dbo.ExportItemDetails.TotalWeightCutting, dbo.ExportItemDetails.lotDetail, 
                      dbo.ExportItemDetails.TotalCarat, dbo.ExportItemDetails.TotalCatte, dbo.ExportItemDetails.TotalBhada, dbo.BillDetails.BillDetailID, dbo.BillDetails.ItemName, dbo.BillDetails.ItemUnit, 
                      dbo.BillDetails.ItemMarca, dbo.BillDetails.fkItemTypeID, dbo.ItemSaleDetails.Quantity - dbo.fun_GetExportQuantityCount(dbo.ItemSaleDetails.ItemSaleDetailID) AS RemainQty, 
                      dbo.BillDetails.CreateDate
FROM         dbo.ItemSaleDetails LEFT OUTER JOIN
                      dbo.ExportItemDetails ON dbo.ItemSaleDetails.ItemSaleDetailID = dbo.ExportItemDetails.fkItemSaleDetailID INNER JOIN
                      dbo.Accounts ON dbo.ItemSaleDetails.fkAccountID = dbo.Accounts.AccountID INNER JOIN
                      dbo.BillDetails ON dbo.ItemSaleDetails.fkBillDetailID = dbo.BillDetails.BillDetailID

