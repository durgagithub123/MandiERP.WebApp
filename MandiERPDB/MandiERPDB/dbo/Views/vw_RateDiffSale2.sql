CREATE VIEW [dbo].[vw_RateDiffSale2]
AS
SELECT     SUM(TotalAmount - CommissionAmount) AS SalesTotalAmount
,SUM(TotalAmount ) AS SalesTotalAmountwCommision
,Sum(CommissionAmount) as SaleCommissionAmount
, fkBillDetailID
,fkBillID
FROM         dbo.ItemSaleDetails where IsActive != '0'
GROUP BY fkBillDetailID,fkBillID
