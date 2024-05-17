CREATE VIEW [dbo].[vw_RateDiff2]
AS
SELECT SUM(TotalAmount - CommissionAmount) AS SalesTotalAmount
	,SUM(TotalAmount) AS SalesTotalAmountwCommision
	,Sum(CommissionAmount) AS SaleCommissionAmount
	,fkBillID
	,fkbilldetailid
	,Max(CreateDate) AS SaleDate
	,dbo.fun_GetRatebyBillDetailID(fkbilldetailid) AS SaleRate
	,dbo.fun_GetSaleDatebyBillDetailID(fkbilldetailid) AS SaleDates
FROM dbo.ItemSaleDetails where IsActive != '0'
--where fkbillid =135    
GROUP BY fkBillID
	,fkbilldetailid --,SaleRate--,CreateDate
