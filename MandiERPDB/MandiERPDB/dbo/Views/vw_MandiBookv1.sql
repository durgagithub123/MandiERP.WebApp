Create VIEW [dbo].[vw_MandiBookv1]
AS
SELECT b.BookNo
	,b.BillID
	,b.BillNo
	,bd.BillDetailID
	,a.AccountID
	,a.AccountName
	,a.AccountMobileNo as AccountMobileNoFarmer
	,acpr.AccountName as AccountFirmName
	,acpr.AccountID as fkAccountIDParty
	,acpr.AccountMobileNo as AccountMobileNoParty
	,acpr.LicenceNo as LicenceNoParty
	--,dbo.[fun_getPartyName](BillDetailID, '') AS AccountFirmName
	--,(select top 1 AccountMobileNo from Accounts a inner join ItemSaleDetails isd on isd.fkBillDetailID = bd.BillDetailID) as AccountMobileNoParty
	--,(select top 1 LicenceNo from Accounts a inner join ItemSaleDetails isd on isd.fkBillDetailID = bd.BillDetailID) as LicenceNoParty
	,b.fkVillageID
	,b.VillageName
	,b.TolParchiNo
	,b.Other1 
	,b.Other2 AS OtherNo
	,b.AnubandNo
	,b.BillDate
	,(
		SELECT TOP 1 Hammali
		FROM Configurations
		) AS HammaliMaster
	,(
		SELECT TOP 1 Tulai
		FROM Configurations
		) AS TulaiMaster
	,bd.ItemName
	,bd.BillNetWeight
	,bd.BillGrossWeight
	,BillRate
	,b.BillCode
	,bd.Quantity
	,bd.NetWeight AS NetWeight
	,bd.ActualTotalAmount
	,bd.TotalHammali
	,bd.TotalTulai
	,bd.TotalKhadiKari
	,bd.TotalHammali + bd.TotalTulai AS TotalHammaliTulai
	,bd.ActualTotalAmount - (bd.TotalHammali + bd.TotalTulai) AS NetTotalAmount
	,bpd.ChequeDate
	,isnull(bpd.ChequeAmount,0)as ChequeAmount
	,isnull(bpd.ChequeAmount, 0) + isnull(bpd.CashAmount, 0) AS NetPaidAmount
	,bpd.CashAmount
	,'IFSC -' + abd.IfscCode + ' A/c-' + abd.BankAccountNo + ' Branch-' + abd.BranchName +' UTR '+ bpd.TransactionNo AS BankDetails
	,ac.AccountFirmName AS CompnayShortName
	,ac.AccountFirmName AS AccountFirmNameCompany
	,ac.AccountMobileNo as AccountMobileNoCompany
	,ac.LicenceNo
	,b.AnubandNoSN
	,b.TolParchiNoSN
	,b.BhugtanNo
	,b.BhugtanNoSN
	,abd.IfscCode
	,abd.AccountHolderName
	,abd.BankAccountNo
	,abd.BranchName
	,abd.AccountBankDetailNo
	,abd.BranchNo
	,bpd.TransactionNo
	,acpm.AccountFirmName as CompanyBankAccountNo,bpd.PaymentMode,bpd.PanNo
	,bpd.Remark as TranParticular
	
FROM Bills b
INNER JOIN Accounts a ON b.fkAccountID = a.AccountID
INNER JOIN BillDetails bd ON b.BillID = bd.fkBillID
LEFT JOIN BillPaymentDetails bpd ON bpd.fkBillID = b.BillID
LEFT JOIN AccountBankDetails abd ON abd.AccountBankDetailID = bpd.fkAccountBankDetailID
Left join Accounts ac on ac.AccountID =21
inner join ItemSaleDetails isd on
isd.fkBillDetailID = bd.BillDetailID
and isd.IsActive != '0'
left join Accounts acpr on acpr.AccountID = isd.fkAccountID
left join Accounts acpm on acpm.AccountID = bpd.CompanyBankAccountID

WHERE b.IsActive != '0' and bd.IsActive != '0' and isd.IsActive != '0'
	AND b.isCompanyAccount = 0
