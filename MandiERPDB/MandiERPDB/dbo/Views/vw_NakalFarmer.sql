CREATE VIEW [dbo].[vw_NakalFarmer]
AS
SELECT     dbo.Bills.BillID, dbo.Bills.BillNo, dbo.Bills.BillDate, dbo.Accounts.AccountName + ' - ' + dbo.Villages.VillageName AS FarmerName, bs.Quantity, bs.NetWeight, dbo.Bills.NetAmount, 
                      dbo.Bills.TotalAmount, bss.CommissionAmountSale, bss.TotalAmountSale, dbo.Bills.TotalAmount + bss.CommissionAmountSale AS NetTotalAmount
FROM         dbo.Bills INNER JOIN
                      dbo.Accounts ON dbo.Bills.fkAccountID = dbo.Accounts.AccountID INNER JOIN
                      dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID INNER JOIN
                      dbo.BillExpenses ON dbo.Bills.BillID = dbo.BillExpenses.fkBillID INNER JOIN
                      dbo.vw_BillQuantityWeightSummary AS bs ON bs.fkBillID = dbo.Bills.BillID INNER JOIN
                      dbo.vw_BillSaleSummary AS bss ON bss.BillID = dbo.Bills.BillID
WHERE     (dbo.Bills.IsActive <> '0')