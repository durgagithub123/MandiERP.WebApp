create view [dbo].[vw_Stock]
as


select bd.BillDetailID,ItemSaleDetails.ItemSaleDetailID, ItemSaleDetails.Quantity - dbo.fun_GetExportQuantityCount(ItemSaleDetails.ItemSaleDetailID) AS RemainQty
--, BillDetails.CreateDate, 
--                      ItemSaleDetails.CreateDate AS ItemDate, BillDetails.BillDetailID, ItemSaleDetails.IsActive
FROM BillDetails bd inner join 

        ItemSaleDetails on bd.BillDetailID = ItemSaleDetails.fkBillDetailID LEFT OUTER JOIN
                      ExportItemDetails ON ItemSaleDetails.ItemSaleDetailID = ExportItemDetails.fkItemSaleDetailID 
                      INNER JOIN
                      Accounts ON ItemSaleDetails.fkAccountID = Accounts.AccountID INNER JOIN
                      BillDetails ON ItemSaleDetails.fkBillDetailID = BillDetails.BillDetailID
                      
                      where ItemSaleDetails.IsActive!='0' and BillDetails.IsActive != '0'