Create view [dbo].[vw_Exports]
AS
SELECT     ItemSaleDetails.ItemSaleDetailID, dbo.fun_getFarmerNameByItemSaleDetailID(ItemSaleDetails.ItemSaleDetailID, 'Full') AS FarmerName, 
                      ItemSaleDetails.fkBillDetailID, ItemSaleDetails.Quantity, ItemSaleDetails.Rate, ItemSaleDetails.PhoneNo, ItemSaleDetails.fkAccountID, Accounts.AccountID, 
                      Accounts.AccountFirmName, Accounts.AccountSortName, Accounts.AccountName, ItemSaleDetails.SaleTypeFixOrWeightBased, ItemSaleDetails.GrossWeight, 
                      ItemSaleDetails.WeightDetails, ItemSaleDetails.NetWeight, ItemSaleDetails.CommissionAmount, ItemSaleDetails.CommissionPercent, ItemSaleDetails.TotalAmount, 
                      ExportItemDetails.ExportItemDetailID, ExportItemDetails.fkItemSaleDetailID, ExportItemDetails.IsCompanyAccount, ExportItemDetails.PartyName, 
                      ExportItemDetails.TotalQuantity, ExportItemDetails.AcutualQuantity, ExportItemDetails.BillQuantity, ExportItemDetails.ActualRate, ExportItemDetails.BillRate, 
                      ExportItemDetails.GrossWeight AS Expr1, ExportItemDetails.BillGrossWeight, ExportItemDetails.NetWeight AS Expr2, ExportItemDetails.BillNetWeight, 
                      ExportItemDetails.TotalAmount AS Expr3, ExportItemDetails.BillTotalAmount, ExportItemDetails.CommissionPercent AS Expr4, 
                      ExportItemDetails.BillCommissionPercent, ExportItemDetails.CommissionAmount AS Expr5, ExportItemDetails.BillCommissionAmount, 
                      ExportItemDetails.TotalHammali, ExportItemDetails.TotalTulai, ExportItemDetails.TotalKhadiKari, ExportItemDetails.NetAmount, ExportItemDetails.BillNetAmount, 
                      ExportItemDetails.TotalWeightCutting, ExportItemDetails.lotDetail, ExportItemDetails.TotalCarat, ExportItemDetails.TotalCatte, ExportItemDetails.TotalBhada, 
                      BillDetails.ItemName, BillDetails.ItemUnit, BillDetails.ItemMarca, BillDetails.fkItemTypeID, 
                      ItemSaleDetails.Quantity - dbo.fun_GetExportQuantityCount(ItemSaleDetails.ItemSaleDetailID) AS RemainQty, BillDetails.CreateDate, 
                      ItemSaleDetails.CreateDate AS ItemDate, BillDetails.BillDetailID, ItemSaleDetails.IsActive
FROM         ItemSaleDetails LEFT OUTER JOIN
                      ExportItemDetails ON ItemSaleDetails.ItemSaleDetailID = ExportItemDetails.fkItemSaleDetailID 
                      INNER JOIN
                      Accounts ON ItemSaleDetails.fkAccountID = Accounts.AccountID INNER JOIN
                      BillDetails ON ItemSaleDetails.fkBillDetailID = BillDetails.BillDetailID
                      
                      where ItemSaleDetails.IsActive!='0' and BillDetails.IsActive != '0'