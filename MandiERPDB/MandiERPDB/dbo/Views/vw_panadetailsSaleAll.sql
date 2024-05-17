Create VIEW [dbo].[vw_panadetailsSaleAll]
AS
SELECT     dbo.Accounts.AccountID, dbo.ItemSaleDetails.fkBillDetailID, dbo.Accounts.AccountFirmName, dbo.fun_getFarmerName(dbo.Bills.BillID, '') AS FarmerShortName, 
                      dbo.fun_getFarmerName(dbo.Bills.BillID, 'Full') AS FarmerName, dbo.ItemSaleDetails.ItemSaleCode AS IsPanaPaid1, dbo.ItemSaleDetails.ItemSaleCodeDetail AS PanaPaidDate, 
                      dbo.Accounts.AccountNo, dbo.Accounts.AccountName, dbo.Accounts.AccountMobileNo, dbo.ItemSaleDetails.IsActive, dbo.ItemSaleDetails.ItemSaleDetailID, dbo.ItemSaleDetails.ItemSaleDetailNo, 
                      dbo.ItemSaleDetails.fkAccountID, dbo.Bills.IsCompanyAccount, dbo.ItemSaleDetails.Quantity, dbo.ItemSaleDetails.Rate, dbo.ItemSaleDetails.GrossWeight, dbo.ItemSaleDetails.WeightDetails, 
                      dbo.ItemSaleDetails.NetWeight, dbo.ItemSaleDetails.CommissionPercent, dbo.Bills.BillDate, CONVERT(VARCHAR(10), dbo.ItemSaleDetails.CreateDate, 103) AS TransactionDate, 
                      dbo.ItemSaleDetails.CreateDate AS TransactionsDate, dbo.Bills.BillID, dbo.Bills.BillNo, dbo.BillDetails.BillDetailID, dbo.BillDetails.BillDetailNo, dbo.BillDetails.ItemName, dbo.BillDetails.ItemUnit, 
                      dbo.ItemUnits.ItemUnit AS ItemUnitName, ISNULL(dbo.Bills.IsCompanyAccount, 0) AS IsPurchaser, dbo.Villages.VillageName, dbo.Accounts.fkVillageID, 
                      dbo.ItemSaleDetails.SaleTypeFixOrWeightBased, dbo.BillDetails.ActualTotalAmount, dbo.ItemSaleDetails.CommissionAmount, dbo.ItemSaleDetails.TotalAmount AS TotalAmount1, 
                      ISNULL(dbo.ItemSaleDetails.TotalAmount, 0) - ISNULL(dbo.ItemSaleDetails.CommissionAmount, 0) AS TotalAmount, ISNULL(dbo.ItemSaleDetails.TotalAmount, 0) AS NetTotalAmount, 
                      dbo.BillDetails.NetWeight AS BNetWeight, dbo.BillDetails.ActualTotalAmount AS BActualTotalAmount, dbo.BillDetails.CommissionAmount AS BCommissionAmount, dbo.BillDetails.BillTotalAmount, 
                      CONVERT(VARCHAR(10), dbo.Bills.BillDate, 103) AS BillDateBill, dbo.BillDetails.Quantity AS ItemQty, dbo.ItemSaleDetails.CreateDate AS SaleDate, dbo.Bills.fkAccountID AS FarmerClientAccountID, 
                      dbo.ItemSaleDetails.ItemSaleCode AS PaidStatus, dbo.ItemSaleDetails.ItemSaleCodeDetail AS PaidDate, dbo.BillDetails.SaleTypeFixOrWeightBased AS BSaleTypeFixOrWeightBased, 
                      dbo.Bills.IsCompanyAccount AS BSaleOrPurchase, dbo.BillDetails.Quantity AS BillQuantity, dbo.BillDetails.BillRate, dbo.ItemSaleDetails.Remark, dbo.Bills.GadiNo, 
                      ISNULL(dbo.ItemSaleDetails.IsPanaPaid, 0) AS IsPanaPaid, ISNULL(dbo.ItemSaleDetails.PaidAmount, 0) AS PaidAmount, ISNULL(dbo.ItemSaleDetails.Discount, 0) AS Discount, 
                      ISNULL(dbo.ItemSaleDetails.RemainingAmount, 0) AS RemainingAmount, dbo.BillDetails.ItemMarca
FROM         dbo.ItemSaleDetails INNER JOIN
                      dbo.Accounts ON dbo.ItemSaleDetails.fkAccountID = dbo.Accounts.AccountID INNER JOIN
                      dbo.BillDetails ON dbo.ItemSaleDetails.fkBillDetailID = dbo.BillDetails.BillDetailID INNER JOIN
                      dbo.Bills ON dbo.BillDetails.fkBillID = dbo.Bills.BillID INNER JOIN
                      dbo.ItemUnits ON dbo.BillDetails.ItemUnit = dbo.ItemUnits.ItemUnitID LEFT OUTER JOIN
                      dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID
--WHERE     (dbo.ItemSaleDetails.IsActive <> '0')

GO