CREATE VIEW [dbo].[vw_panadetailsKharidi]
AS
SELECT     Accounts.AccountID, ItemSaleDetails.fkBillDetailID, Accounts.AccountFirmName, dbo.fun_getFarmerName(Bills.BillID, '') AS FarmerShortName, 
                      dbo.fun_getFarmerName(Bills.BillID, 'Full') AS FarmerName, Accounts.AccountNo, Accounts.AccountName, Accounts.AccountMobileNo, Bills.IsActive,
                      ItemSaleDetails.ItemSaleDetailID, ItemSaleDetails.ItemSaleDetailNo, ItemSaleDetails.fkAccountID, ItemSaleDetails.IsCompanyAccount, ItemSaleDetails.Quantity, 
                      ItemSaleDetails.Rate, ItemSaleDetails.GrossWeight, ItemSaleDetails.WeightDetails, ItemSaleDetails.NetWeight, ItemSaleDetails.CommissionPercent, Bills.BillDate, 
                      Bills.BillDate AS TransactionDate, Bills.BillID, Bills.BillNo, BillDetails.BillDetailID, BillDetails.BillDetailNo, BillDetails.ItemName, BillDetails.ItemUnit, 
                      ISNULL(Bills.IsCompanyAccount, 0) AS IsPurchaser, Villages.VillageName, Accounts.fkVillageID, ItemSaleDetails.SaleTypeFixOrWeightBased, 
                      BillDetails.ActualTotalAmount, ItemSaleDetails.CommissionAmount, ItemSaleDetails.TotalAmount AS TotalAmount1, ISNULL(ItemSaleDetails.TotalAmount, 0) 
                      - ISNULL(ItemSaleDetails.CommissionAmount, 0) AS TotalAmount, ISNULL(ItemSaleDetails.TotalAmount, 0) AS NetTotalAmount, BillDetails.BillRate, 
                      BillDetails.NetWeight AS BNetWeight, BillDetails.CommissionAmount AS BCommissionAmount, BillDetails.BillTotalAmount
FROM         ItemSaleDetails INNER JOIN
                      Accounts ON ItemSaleDetails.fkAccountID = Accounts.AccountID INNER JOIN
                      BillDetails ON ItemSaleDetails.fkBillDetailID = BillDetails.BillDetailID INNER JOIN
                      Bills ON BillDetails.fkBillID = Bills.BillID LEFT OUTER JOIN
                      Villages ON Accounts.fkVillageID = Villages.VillageID
