create VIEW [dbo].[vw_BillDetailePortal]
AS
SELECT 
	dbo.Accounts.AccountName as 'Seller_Name'
	,dbo.Bills.VillageName as 'Seller_Address'
	,dbo.Bills.FirmPhoneNo as 'SellerMob'
	,dbo.Bills.AnubandNoSN as 'Anubandh_No'
	--,CONVERT(char(10),dbo.Bills.BillDate,126) as 'Anubandh_Date'
	,dbo.Bills.BillDate as 'Anubandh_Date'
	,dbo.Bills.BhugtanNoSN as 'Bhugtan_No'
	,CONVERT(char(10),dbo.BillPaymentDetails.InsertDate,126) as 'Bhugtan_Date'
	,dbo.BillDetails.BillRate * 100 as 'Auction_Rate'
	,dbo.BillDetails.BillNetWeight as 'Actual_Weight'
	,dbo.Bills.TotalDeduction as 'Total_Hammali_Toul'
	,dbo.Bills.NetAmount as 'Farmer_Payment'
	,dbo.BillPaymentDetails.[PaymentMode] as 'Payment_Mode'
	,dbo.BillPaymentDetails.[CashAmount] as 'CashAmount'
	,CONVERT(char(10),dbo.BillPaymentDetails.InsertDate,126) as 'Cash_Payment_Date'
	,dbo.BillPaymentDetails.[ChequeAmount] as 'Online_Pay_Amount'
	,replace( CONVERT(char(10),dbo.BillPaymentDetails.[ChequeDate],126), '1900-01-01','') as 'Online_Payment_Date'
	,dbo.BillPaymentDetails.[IfscCode] as 'IFSC_Code'
	,dbo.BillPaymentDetails.[BankAccountNo] as 'Farmer_BankAccount'
	,dbo.BillPaymentDetails.[TransactionNo] as 'UTR'
	,'A' as 'ASFlag'
	,'A' as 'Grade'
	,'' as 'OrganicInorganic'
FROM dbo.Bills
INNER JOIN dbo.Accounts ON dbo.Bills.fkAccountID = dbo.Accounts.AccountID
INNER JOIN dbo.BillDetails ON dbo.Bills.BillID = dbo.BillDetails.fkBillID
INNER JOIN dbo.BillPaymentDetails ON dbo.Bills.BillID = dbo.BillPaymentDetails.fkBillID
WHERE (dbo.Bills.IsActive <> '0')
	AND (dbo.Bills.IsCompanyAccount = 0)