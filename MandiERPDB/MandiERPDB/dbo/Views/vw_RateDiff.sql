CREATE VIEW [dbo].[vw_RateDiff]    
AS    
SELECT        dbo.vw_RateDiff1.BillID, dbo.vw_RateDiff1.AccountName, dbo.vw_RateDiff1.BillNo, ROUND(dbo.vw_RateDiff1.BillTotalAmount, 0) AS BillTotalAmount, dbo.vw_RateDiff1.VillageName, dbo.vw_RateDiff1.BillDate,     
                         ROUND(dbo.vw_RateDiff2.SalesTotalAmount, 0) AS SalesTotalAmount, dbo.vw_RateDiff2.fkBillID, dbo.vw_RateDiff1.IsActive, dbo.vw_RateDiff1.IsCompanyAccount,     
                         ROUND(dbo.vw_RateDiff2.SalesTotalAmountwCommision, 0) AS SalesTotalAmountwCommision, ROUND(dbo.vw_RateDiff1.BillTotalAmountwCommission, 0) AS BillTotalAmountwCommission,     
                         dbo.vw_RateDiff1.BillCommissionAmount, dbo.vw_RateDiff2.SaleCommissionAmount    
                         , dbo.vw_RateDiff2.SaleDate   
                         , dbo.vw_RateDiff1.ItemName,vw_RateDiff1.Quantity   
                         ,vw_RateDiff1.BillRate  
                         ,vw_RateDiff2.SaleRate  
                         ,dbo.vw_RateDiff2.SaleDates
FROM            dbo.vw_RateDiff1 INNER JOIN    
                         dbo.vw_RateDiff2 ON dbo.vw_RateDiff1.BillDetailID = dbo.vw_RateDiff2.fkBillDetailID

