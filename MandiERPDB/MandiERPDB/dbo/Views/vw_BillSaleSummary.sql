create view [dbo].[vw_BillSaleSummary]
as

select bills.BillID,sum(ItemSaleDetails.CommissionAmount) as CommissionAmountSale,sum(ItemSaleDetails.TotalAmount) as TotalAmountSale

FROM dbo.ItemSaleDetails
INNER JOIN dbo.Accounts ON dbo.ItemSaleDetails.fkAccountID = dbo.Accounts.AccountID
INNER JOIN dbo.BillDetails ON dbo.ItemSaleDetails.fkBillDetailID = dbo.BillDetails.BillDetailID
INNER JOIN dbo.Bills ON dbo.BillDetails.fkBillID = dbo.Bills.BillID
INNER JOIN dbo.ItemUnits ON dbo.BillDetails.ItemUnit = dbo.ItemUnits.ItemUnitID
LEFT OUTER JOIN dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID
WHERE (dbo.ItemSaleDetails.IsActive <> '0')

group by bills.BillID