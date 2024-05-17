
CREATE view [dbo].[vw_BillDetailSaleCW]
as
SELECT Accounts.AccountID
	,Accounts.AccountName
	,sa.AccountName as PartyName
	,Bills.fkVillageID
	,BillDetails.NetWeight
	,Bills.VillageName
	,Bills.BillNo
	,Bills.BillPaidStatus
	,Bills.IsBillPrint
	,Bills.FirmPhoneNo
	,Bills.TotalStationary
	,Bills.BillDate
	,CONVERT(VARCHAR(10), Bills.BillDate, 103) AS BillDateFormatted
	,Bills.TransPortName
	,Bills.BiltiNo
	,CONVERT(VARCHAR(10),bills.AawakDate, 103) AS AawakDate
	,bills.AddressDetail
	,bills.StateDetails
	,bills.BillPrintType
	
	,Bills.GadiNo
	,Bills.GadiBhada
	,Bills.PreviousBalance
	,BillDetails.BillDetailID
	,BillDetails.SNo
	,BillDetails.ItemName
	,BillDetails.ItemUnit
	,BillDetails.ItemMarca
	,isd.Quantity
	,isd.Rate AS BillRate
	,BillDetails.CommissionAmount
	,isd.GrossWeight AS BillGrossWeight
	,isd.NetWeight AS BillNetWeight
	,replace(replace(replace(BillDetails.WeightDetails, '.00', ''), '.50', '.5'), ',', ', ') AS WeightDetails
	,BillExpenses.TotalHammali
	,BillExpenses.TotalTulai
	,Bills.TotalKhadiKarai
	,isd.TotalAmount AS BillTotalAmount
	,isd.TotalAmount AS ActualTotalAmount
	,BillDetails.TotalWeightCutting
	,0 AS Sevasulk
	,0 AS Innam
	,0 AS CashAdvace
	,Bills.TotalStationary AS Stationery
	,0 AS Postage
	,0 AS Other
	,convert(BIT, CASE 
			WHEN Bills.BillPaidStatus = 'Cash'
				THEN 1
			ELSE 0
			END) AS PaidStatus
	  ,BillExpenses.[TotalGadiBhada]
      ,BillExpenses.[TotalAdvance]
      --,[TotalHammali]
      --,[TotalTulai]
      ,BillExpenses.[TotalBarwai]
      ,BillExpenses.[TotalMaidanHammali]
      ,BillExpenses.[TotalPalaKarai]
      ,BillExpenses.[TotalThelaBhada]
      ,BillExpenses.[TotalBardan]
      ,BillExpenses.[TotalOthersExp]
      ,BillExpenses.[TotalCommissionExp]
      ,BillExpenses.[TotalMandiTax]
      ,BillExpenses.[TotalLabourCharge]
      ,BillExpenses.[TotalDhulaiCharge]
      ,BillExpenses.GatePassAmount
      ,BillExpenses.StoreBhadaAmount
      ,BillExpenses.DalaAmount

      ,BillExpenses.[OtherExpense1]
      ,BillExpenses.[OtherExpense2]
      ,BillExpenses.[OtherExpense3]
      ,BillExpenses.[OtherExpense4]
      ,BillExpenses.[OtherExpense5]
	,'' AS [BankExpenses]
      ,BillExpenses.[Other1]
      ,BillExpenses.[Other2]
      ,BillExpenses.[Other3]
      ,BillExpenses.[Other4]
      ,BillExpenses.[Other5]
      
	,[AvgWeight]
	,Bills.TotalAmount as BillFinalTotalAmount
	,Bills.TotalDeduction as BillFinalTotalDeduction
	,Bills.NetAmount as BillFinalNetAmount
	,Bills.IsActive
	,Bills.isCompanyAccount
FROM Bills
INNER JOIN Accounts ON Bills.fkAccountID = Accounts.AccountID
INNER JOIN BillExpenses ON Bills.BillID = BillExpenses.fkBillID
INNER JOIN dbo.BillDetails ON Bills.BillID = BillDetails.fkBillID
	AND BillDetails.IsActive != '0'
INNER JOIN Itemsaledetails isd ON isd.fkBillDetailID = BillDetails.BillDetailID
	AND isd.IsActive != '0'
INNER JOIN Accounts sa ON isd.fkAccountID = sa.AccountID
WHERE Bills.IsActive != '0' 
	AND Bills.isCompanyAccount = 0

