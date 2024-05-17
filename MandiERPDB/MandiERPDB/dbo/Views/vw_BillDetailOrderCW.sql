
CREATE VIEW [dbo].[vw_BillDetailOrderCW]
AS
SELECT Bills.BillID
	,Accounts.AccountID
	,Accounts.AccountName
	,'' AS PartyName
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
	,CONVERT(VARCHAR(10), bills.AawakDate, 103) AS AawakDate
	,bills.AddressDetail
	,bills.StateDetails
	,bills.BillPrintType
	,Bills.GadiNo
	--,TotalGadiBhada AS GadiBhada
	,Bills.PreviousBalance
	,BillDetails.BillDetailID
	,BillDetails.SNo
	,BillDetails.ItemName
	,BillDetails.ItemUnit
	,BillDetails.ItemMarca
	,BillDetails.Quantity
	,BillDetails.CommissionAmount
	,BillDetails.BillRate
	,BillDetails.BillGrossWeight
	,BillDetails.BillNetWeight
	,replace(replace(replace(BillDetails.WeightDetails, '.00', ''), '.50', '.5'), ',', ', ') AS WeightDetails
	,Bills.TotalKhadiKarai
	,BillDetails.BillTotalAmount
	,BillDetails.ActualTotalAmount
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
	,BillExpenses.TotalHammali
	,BillExpenses.TotalTulai
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
	
	
	,BEMandi.[TotalGadiBhada] AS TotalGadiBhadaMandi
	,BEMandi.[TotalAdvance] AS TotalAdvanceMandi
	,BEMandi.TotalHammali AS TotalHammaliMandi
	,BEMandi.TotalTulai AS TotalTulaiMandi
	,BEMandi.[TotalBarwai] AS TotalBarwaiMandi
	,BEMandi.[TotalMaidanHammali] AS TotalMaidanHammaliMandi
	,BEMandi.[TotalPalaKarai] AS TotalPalaKaraiMandi
	,BEMandi.[TotalThelaBhada] AS TotalThelaBhadaMandi
	,BEMandi.[TotalBardan] AS TotalBardanMandi
	,BEMandi.[TotalOthersExp] AS TotalOthersExpMandi
	,BEMandi.[TotalCommissionExp] AS TotalCommissionExpMandi
	,BEMandi.[TotalMandiTax] AS TotalMandiTaxMandi
	,BEMandi.[TotalLabourCharge] AS TotalLabourChargeMandi
	,BEMandi.[TotalDhulaiCharge] AS TotalDhulaiChargeMandi
	,BEMandi.GatePassAmount AS GatePassAmountMandi
	,BEMandi.StoreBhadaAmount AS StoreBhadaAmountMandi
	,BEMandi.DalaAmount AS DalaAmountMandi
	,BEMandi.[OtherExpense1] AS OtherExpense1Mandi
	,BEMandi.[OtherExpense2] AS OtherExpense2Mandi
	,BEMandi.[OtherExpense3] AS OtherExpense3Mandi
	,BEMandi.[OtherExpense4] AS OtherExpense4Mandi
	,BEMandi.[OtherExpense5] AS OtherExpense5Mandi
	,BEMandi.[Other1] AS Other1Mandi
	,BEMandi.[Other2] AS Other2Mandi
	,BEMandi.[Other3] AS Other3Mandi
	,BEMandi.[Other4] AS Other4Mandi
	,BEMandi.[Other5] AS Other5Mandi
	,Bills.IsActive
	,Bills.isCompanyAccount
	,bills.BillCode
	,bills.TotalOtherCharges
	,bills.TotalPostageCharge
	,Bills.TotalAmount AS BillFinalTotalAmount
	,Bills.TotalDeduction AS BillFinalTotalDeduction
	,Bills.NetAmount AS BillFinalNetAmount
FROM Bills
INNER JOIN Accounts ON Bills.fkAccountID = Accounts.AccountID
INNER JOIN BillExpenses ON Bills.BillID = BillExpenses.fkBillID
	AND BillExpenses.BillExpenseCode = 1
INNER JOIN BillExpenses AS BEMandi ON Bills.BillID = BEMandi.fkBillID
	AND BEMandi.BillExpenseCode = 2
INNER JOIN BillDetails ON Bills.BillID = BillDetails.fkBillID and  BillDetails.IsActive != '0'
--INNER JOIN dbo.ItemSaleDetails isd ON isd.fkBillDetailID = BillDetails.BillDetailID
--INNER JOIN Accounts ai ON isd.fkAccountID = ai.AccountID
WHERE Bills.IsActive != '0' and BillDetails.IsActive != '0'
	AND Bills.isCompanyAccount = 1
	AND bills.BillCode = '2'



