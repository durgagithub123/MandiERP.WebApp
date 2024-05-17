CREATE VIEW [dbo].[vw_RateDiffSale]
AS
SELECT        dbo.vw_RateDiffSale1.BillID, dbo.vw_RateDiffSale1.AccountName, dbo.vw_RateDiffSale1.BillNo, ROUND(dbo.vw_RateDiffSale1.BillTotalAmount, 0) AS BillTotalAmount, dbo.vw_RateDiffSale1.VillageName, dbo.vw_RateDiffSale1.BillDate, 
                         ROUND(dbo.vw_RateDiffSale2.SalesTotalAmount, 0) AS SalesTotalAmount, dbo.vw_RateDiffSale2.fkBillDetailID, dbo.vw_RateDiffSale1.IsActive, dbo.vw_RateDiffSale1.IsCompanyAccount, 
                         ROUND(dbo.vw_RateDiffSale2.SalesTotalAmountwCommision, 0) AS SalesTotalAmountwCommision, ROUND(dbo.vw_RateDiffSale1.BillTotalAmountwCommission, 0) AS BillTotalAmountwCommission, 
                         dbo.vw_RateDiffSale1.BillCommissionAmount, dbo.vw_RateDiffSale2.SaleCommissionAmount
						 ,vw_RateDiffSaleDateDetails.SaleDate
FROM            dbo.vw_RateDiffSale1 INNER JOIN
                         dbo.vw_RateDiffSale2 ON dbo.vw_RateDiffSale1.BillDetailID = dbo.vw_RateDiffSale2.fkBillDetailID
						 inner join vw_RateDiffSaleDateDetails  on vw_RateDiffSaleDateDetails.fkBillDetailID = dbo.vw_RateDiffSale2.fkBillDetailID
