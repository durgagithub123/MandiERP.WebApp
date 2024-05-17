CREATE VIEW [dbo].[vw_panadetails_old]
AS
SELECT     dbo.Accounts.AccountID, dbo.ItemSaleDetails.fkBillDetailID, dbo.Accounts.AccountFirmName, dbo.fun_getFarmerName(dbo.Bills.BillID, '') AS FarmerShortName, 
                      dbo.fun_getFarmerName(dbo.Bills.BillID, 'Full') AS FarmerName, dbo.Accounts.AccountNo, dbo.Accounts.AccountName, dbo.Accounts.AccountMobileNo, 
                      dbo.ItemSaleDetails.ItemSaleDetailID, dbo.ItemSaleDetails.ItemSaleDetailNo, dbo.ItemSaleDetails.fkAccountID, dbo.ItemSaleDetails.IsCompanyAccount, 
                      dbo.ItemSaleDetails.Quantity, dbo.ItemSaleDetails.Rate, dbo.ItemSaleDetails.GrossWeight, dbo.ItemSaleDetails.WeightDetails, dbo.ItemSaleDetails.NetWeight, 
                      dbo.ItemSaleDetails.CommissionPercent, dbo.ItemSaleDetails.CommissionAmount, dbo.ItemSaleDetails.TotalAmount, 
                      ISNULL(dbo.ItemSaleDetails.CommissionAmount, 0) + ISNULL(dbo.ItemSaleDetails.TotalAmount, 0) AS NetTotalAmount, dbo.Bills.BillDate, 
                      dbo.Bills.BillDate AS TransactionDate, dbo.Bills.BillID, dbo.Bills.BillNo, dbo.BillDetails.BillDetailID, dbo.BillDetails.BillDetailNo, dbo.BillDetails.ItemName, 
                      dbo.BillDetails.ItemUnit, ISNULL(dbo.Bills.IsCompanyAccount, 0) AS IsPurchaser, dbo.Villages.VillageName, dbo.Accounts.fkVillageID, 
                      dbo.ItemSaleDetails.SaleTypeFixOrWeightBased, dbo.BillDetails.ActualTotalAmount
FROM         dbo.ItemSaleDetails INNER JOIN
                      dbo.Accounts ON dbo.ItemSaleDetails.fkAccountID = dbo.Accounts.AccountID INNER JOIN
                      dbo.BillDetails ON dbo.ItemSaleDetails.fkBillDetailID = dbo.BillDetails.BillDetailID INNER JOIN
                      dbo.Bills ON dbo.BillDetails.fkBillID = dbo.Bills.BillID LEFT OUTER JOIN
                      dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID

