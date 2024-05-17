Create VIEW [dbo].[vw_panadetailsSaleMissingPana]
AS
SELECT     Accounts.AccountID, BillDetailID as fkBillDetailID, Accounts.AccountFirmName, dbo.fun_getFarmerName(Bills.BillID, '') AS FarmerShortName, 
                      dbo.fun_getFarmerName(Bills.BillID, 'Full') AS FarmerName,
					  ItemSaleCode as IsPanaPaid,ItemSaleCodeDetail PanaPaidDate ,
					   Accounts.AccountNo, Accounts.AccountName, Accounts.AccountMobileNo, BillDetails.IsActive,
                      ItemSaleDetails.ItemSaleDetailID, ItemSaleDetails.ItemSaleDetailNo, ItemSaleDetails.fkAccountID, Bills.IsCompanyAccount, ItemSaleDetails.Quantity, 
                      ItemSaleDetails.Rate, ItemSaleDetails.GrossWeight, ItemSaleDetails.WeightDetails, ItemSaleDetails.NetWeight, ItemSaleDetails.CommissionPercent,Bills.BillDate AS  BillDate, convert(varchar(10), ItemSaleDetails.CreateDate,103) AS  TransactionDate,ItemSaleDetails.CreateDate AS  TransactionsDate, Bills.BillID, 
                      Bills.BillNo, BillDetails.BillDetailID, BillDetails.BillDetailNo, BillDetails.ItemName, BillDetails.ItemUnit, ItemUnits.ItemUnit AS ItemUnitName, 
                      ISNULL(Bills.IsCompanyAccount, 0) AS IsPurchaser, Villages.VillageName, Accounts.fkVillageID, ItemSaleDetails.SaleTypeFixOrWeightBased, 
                      BillDetails.ActualTotalAmount, ItemSaleDetails.CommissionAmount, ItemSaleDetails.TotalAmount AS TotalAmount1, ISNULL(ItemSaleDetails.TotalAmount, 0) 
                      - ISNULL(ItemSaleDetails.CommissionAmount, 0) AS TotalAmount, ISNULL(ItemSaleDetails.TotalAmount, 0) AS NetTotalAmount, 
                      BillDetails.NetWeight AS BNetWeight, BillDetails.ActualTotalAmount AS BActualTotalAmount, BillDetails.CommissionAmount AS BCommissionAmount, 
                      BillDetails.BillTotalAmount,convert(varchar(10), bills.BillDate,103) as BillDateBill,BillDetails.Quantity as ItemQty
					  ,ItemSaleDetails.CreateDate as SaleDate
					  ,Bills.fkAccountID as FarmerClientAccountID
					  ,ItemSaleDetails.ItemSaleCode as PaidStatus
					  ,ItemSaleCodeDetail as PaidDate
					  ,BillDetails.SaleTypeFixOrWeightBased as BSaleTypeFixOrWeightBased
					  ,Bills.IsCompanyAccount  as BSaleOrPurchase
					  ,BillDetails.Quantity as BillQuantity
					  , BillDetails.BillRate as BillRate
					  ,ItemSaleDetails.Remark as Remark
					  ,BillDetails.CommissionPercent as BillCommissionPercent
FROM     Bills inner join      
		BillDetails  on BillDetails.fkBillID = Bills.BillID
		inner join Accounts on
			Bills.fkAccountID = Accounts.AccountID 
		Left Join ItemSaleDetails on
			ItemSaleDetails.fkBillDetailID = BillDetails.BillDetailID
			and ItemSaleDetails.fkBillID= bills.BillID
			left JOIN
                      ItemUnits ON BillDetails.ItemUnit = ItemUnits.ItemUnitID LEFT OUTER JOIN
                      Villages ON Accounts.fkVillageID = Villages.VillageID
	
		where ItemSaleDetailID is null
