create view [dbo].[vw_FinalReportExport]
as
SELECT        ItemSaleDetails.fkAccountID, ItemSaleDetails.ItemSaleDetailID, dbo.fun_getFarmerNameByItemSaleDetailID(ItemSaleDetails.ItemSaleDetailID, 'Full') AS FarmerName, 
                         ItemSaleDetails.Quantity - dbo.fun_GetExportQuantityCount(ItemSaleDetails.ItemSaleDetailID) AS RemainQty, ItemSaleDetails.Quantity, ItemSaleDetails.Rate, ItemSaleDetails.SaleTypeFixOrWeightBased, 
                         ItemSaleDetails.GrossWeight, ItemSaleDetails.CommissionAmount, ItemSaleDetails.TotalAmount
FROM            ItemSaleDetails LEFT OUTER JOIN
                         ExportItemDetails ON ItemSaleDetails.ItemSaleDetailID = ExportItemDetails.fkItemSaleDetailID INNER JOIN
                         Accounts ON ItemSaleDetails.fkAccountID = Accounts.AccountID INNER JOIN
                         BillDetails ON ItemSaleDetails.fkBillDetailID = BillDetails.BillDetailID
WHERE        (ItemSaleDetails.IsActive <> '0') AND (ItemSaleDetails.fkAccountID = 25)
					  --AND  RemainQty > 0
