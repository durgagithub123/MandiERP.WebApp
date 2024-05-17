CREATE VIEW [dbo].[vw_RateDiffSale1]
AS
SELECT     dbo.Bills.BillID, dbo.Accounts.AccountName, dbo.Bills.BillNo
, SUM(dbo.BillDetails.ActualTotalAmount) AS BillTotalAmount
,SUM(dbo.BillDetails.ActualTotalAmount + dbo.BillDetails.CommissionAmount) AS BillTotalAmountwCommission
,sum(dbo.BillDetails.CommissionAmount) as BillCommissionAmount
, dbo.Bills.VillageName, dbo.Bills.BillDate, 
                      dbo.Bills.IsActive,Bills.IsCompanyAccount,BillDetailID
FROM         dbo.Bills INNER JOIN
                      dbo.BillDetails ON dbo.Bills.BillID = dbo.BillDetails.fkBillID INNER JOIN
                      dbo.Accounts ON dbo.Bills.fkAccountID = dbo.Accounts.AccountID
GROUP BY dbo.Bills.BillID, dbo.Accounts.AccountName, dbo.Bills.BillNo, dbo.Bills.VillageName, dbo.Bills.BillDate, dbo.Bills.IsActive,Bills.IsCompanyAccount,BillDetailID,Bills.IsCompanyAccount
,BillDetailID
