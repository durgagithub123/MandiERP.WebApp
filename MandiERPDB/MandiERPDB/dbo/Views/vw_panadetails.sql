CREATE VIEW [dbo].[vw_panadetails]
AS
SELECT Accounts.AccountID
	,ItemSaleDetails.fkBillDetailID
	,Accounts.AccountFirmName
	,dbo.fun_getFarmerName(Bills.BillID, '') AS FarmerShortName
	,dbo.fun_getFarmerName(Bills.BillID, 'Full') AS FarmerName
	,ItemSaleCode AS IsPanaPaid
	,ItemSaleCodeDetail PanaPaidDate
	,Accounts.AccountNo
	,Accounts.AccountName
	,Accounts.AccountMobileNo
	,ItemSaleDetails.IsActive
	,ItemSaleDetails.ItemSaleDetailID
	,ItemSaleDetails.ItemSaleDetailNo
	,ItemSaleDetails.fkAccountID
	,ItemSaleDetails.IsCompanyAccount
	,ItemSaleDetails.Quantity
	,ItemSaleDetails.Rate
	,ItemSaleDetails.GrossWeight
	,ItemSaleDetails.WeightDetails
	,ItemSaleDetails.NetWeight
	,ItemSaleDetails.CommissionPercent
	,Bills.BillDate
	,Bills.BillDate AS TransactionDate
	,Bills.BillID
	,Bills.BillNo
	,BillDetails.BillDetailID
	,BillDetails.BillDetailNo
	,BillDetails.ItemName
	,BillDetails.ItemUnit
	,BillDetails.ItemMarca
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
	,BillDetails.BillRate
	,BillDetails.NetWeight AS BNetWeight
	,BillDetails.ActualTotalAmount AS BActualTotalAmount
	,BillDetails.CommissionAmount AS BCommissionAmount
	,BillDetails.BillTotalAmount
	,ItemSaleDetails.Remark
	,Itemsaledetails.CreateDate AS SaleDate
	,0.00 as OpeningBalance
		,0.00  as AmountReceived
		,0.00  as AmountPaid
		,0.00  as Purchase
		,0.00  as Sale
FROM ItemSaleDetails
INNER JOIN Accounts ON ItemSaleDetails.fkAccountID = Accounts.AccountID
INNER JOIN BillDetails ON ItemSaleDetails.fkBillDetailID = BillDetails.BillDetailID
INNER JOIN Bills ON BillDetails.fkBillID = Bills.BillID
INNER JOIN ItemUnits ON BillDetails.ItemUnit = ItemUnits.ItemUnitID
LEFT OUTER JOIN Villages ON Accounts.fkVillageID = Villages.VillageID
where ItemSaleDetails.IsActive != '0'
