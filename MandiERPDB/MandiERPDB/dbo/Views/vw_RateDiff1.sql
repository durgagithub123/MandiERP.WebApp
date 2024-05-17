CREATE VIEW [dbo].[vw_RateDiff1]    
AS    
SELECT     dbo.Bills.BillID,dbo.BillDetails.BillDetailID, dbo.Accounts.AccountName, dbo.Bills.BillNo    
, SUM(dbo.BillDetails.ActualTotalAmount) AS BillTotalAmount    
,SUM(dbo.BillDetails.ActualTotalAmount + dbo.BillDetails.CommissionAmount) AS BillTotalAmountwCommission    
,sum(dbo.BillDetails.CommissionAmount) as BillCommissionAmount    
, dbo.Bills.VillageName, dbo.Bills.BillDate,     
                      dbo.Bills.IsActive,Bills.IsCompanyAccount   
                      ,BillDetails.ItemName,BillDetails.Quantity,BillDetails.BillRate  
FROM         dbo.Bills INNER JOIN    
                      dbo.BillDetails ON dbo.Bills.BillID = dbo.BillDetails.fkBillID INNER JOIN    
                      dbo.Accounts ON dbo.Bills.fkAccountID = dbo.Accounts.AccountID  
               --where      dbo.Bills.BillID=135      
GROUP BY dbo.Bills.BillID,dbo.BillDetails.BillDetailID,BillDetails.ItemName,BillDetails.Quantity,BillDetails.BillRate , dbo.Accounts.AccountName, dbo.Bills.BillNo, dbo.Bills.VillageName, dbo.Bills.BillDate, dbo.Bills.IsActive,Bills.IsCompanyAccount
