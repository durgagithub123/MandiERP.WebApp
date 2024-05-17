

create VIEW [dbo].[vw_PanaDetailsWithExportItems]
AS

SELECT Accounts.AccountID
	,ItemSaleDetails.fkBillDetailID
	,Accounts.AccountFirmName
	,dbo.fun_getFarmerName(Bills.BillID, '') AS FarmerShortName
	,dbo.fun_getFarmerName(Bills.BillID, 'Full') AS FarmerName
	,ItemSaleCode AS IsPanaPaid1
	,ItemSaleCodeDetail PanaPaidDate
	,Accounts.AccountNo
	,Accounts.AccountName
	,Accounts.AccountMobileNo
	,ItemSaleDetails.IsActive
	,ItemSaleDetails.ItemSaleDetailID
	,ItemSaleDetails.ItemSaleDetailNo
	,ItemSaleDetails.fkAccountID
	,Bills.IsCompanyAccount
	,ItemSaleDetails.Quantity
	,ItemSaleDetails.Rate
	,ItemSaleDetails.GrossWeight
	,ItemSaleDetails.WeightDetails
	,ItemSaleDetails.NetWeight
	,ItemSaleDetails.CommissionPercent
	,Bills.BillDate AS BillDate
	,convert(VARCHAR(10), ItemSaleDetails.CreateDate, 103) AS TransactionDate
	,ItemSaleDetails.CreateDate AS TransactionsDate
	,Bills.BillID
	,Bills.BillNo
	,BillDetails.BillDetailID
	,BillDetails.BillDetailNo
	,BillDetails.ItemName
	,BillDetails.ItemUnit
	,ItemUnits.ItemUnit AS ItemUnitName
	,ISNULL(Bills.IsCompanyAccount, 0) AS IsPurchaser
	,Villages.VillageName
	,Accounts.fkVillageID
	,ItemSaleDetails.SaleTypeFixOrWeightBased
	,BillDetails.ActualTotalAmount
	,ItemSaleDetails.CommissionAmount
	,ItemSaleDetails.TotalAmount AS TotalAmount1
	,ISNULL(ItemSaleDetails.TotalAmount, 0) - ISNULL(ItemSaleDetails.CommissionAmount, 0) AS TotalAmount
	,ISNULL(ItemSaleDetails.TotalAmount, 0) AS NetTotalAmount
	,BillDetails.NetWeight AS BNetWeight
	,BillDetails.ActualTotalAmount AS BActualTotalAmount
	,BillDetails.CommissionAmount AS BCommissionAmount
	,BillDetails.BillTotalAmount
	,convert(VARCHAR(10), bills.BillDate, 103) AS BillDateBill
	,BillDetails.Quantity AS ItemQty
	,ItemSaleDetails.CreateDate AS SaleDate
	,Bills.fkAccountID AS FarmerClientAccountID
	,ItemSaleDetails.ItemSaleCode AS PaidStatus
	,ItemSaleCodeDetail AS PaidDate
	,BillDetails.SaleTypeFixOrWeightBased AS BSaleTypeFixOrWeightBased
	,Bills.IsCompanyAccount AS BSaleOrPurchase
	,BillDetails.Quantity AS BillQuantity
	,BillDetails.BillRate AS BillRate
	,ItemSaleDetails.Remark AS Remark
	,Bills.GadiNo
	,isnull(ItemSaleDetails.IsPanaPaid,0) as IsPanaPaid
	,isnull(ItemSaleDetails.PaidAmount,0) as PaidAmount
	,isnull(ItemSaleDetails.Discount,0) as Discount
	,isnull(ItemSaleDetails.RemainingAmount,0) as RemainingAmount
	,isnull(vw_ExportItemQuantity.TotalQuantityInExport,0) as TotalQuantityInExport
	,ItemSaleDetails.Quantity - isnull(vw_ExportItemQuantity.TotalQuantityInExport,0) as RemainingQuantity
FROM ItemSaleDetails
INNER JOIN Accounts ON ItemSaleDetails.fkAccountID = Accounts.AccountID
INNER JOIN BillDetails ON ItemSaleDetails.fkBillDetailID = BillDetails.BillDetailID
INNER JOIN Bills ON BillDetails.fkBillID = Bills.BillID
INNER JOIN ItemUnits ON BillDetails.ItemUnit = ItemUnits.ItemUnitID
LEFT OUTER JOIN Villages ON Accounts.fkVillageID = Villages.VillageID
Left JOIN vw_ExportItemQuantity on vw_ExportItemQuantity.fkItemSaleDetailID = ItemSaleDetails.ItemSaleDetailID
where ItemSaleDetails.IsActive != '0'