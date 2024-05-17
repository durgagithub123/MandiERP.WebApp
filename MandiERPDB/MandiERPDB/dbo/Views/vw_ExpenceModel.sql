CREATE VIEW [dbo].[vw_ExpenceModel]
AS

SELECT     'Total-Commission' AS expence, SUM(dbo.ItemSaleDetails.CommissionAmount) AS Amount, bills.BillDate
FROM         ItemSaleDetails INNER JOIN
                      dbo.Bills ON dbo.ItemSaleDetails.fkBillID = dbo.Bills.BillID
                      where (bills.IsActive != '0')
                      
GROUP BY dbo.Bills.BillDate
UNION ALL

SELECT     'Total-Hammali' AS Expence, SUM(TotalHammali) AS Amount, BillDate
FROM         vw_BillExpenseSummary  
GROUP BY BillDate
UNION ALL
SELECT     'Total-Tulai' AS Expence, SUM(TotalTulai) AS Amount, BillDate
FROM         vw_BillExpenseSummary 
                      
GROUP BY BillDate
UNION ALL
SELECT     'Total-KhadiKarai' AS Expence, SUM(OtherExpense2) AS Amount, BillDate
FROM         vw_BillExpenseSummary 
                      
GROUP BY BillDate
UNION ALL
SELECT     'Total-Barwai' AS expence, SUM(TotalBarwai) AS Amount, BillDate
FROM         vw_BillExpenseSummary 
                      
GROUP BY BillDate
UNION ALL
SELECT     'Total-MaidanHammali' AS expence, SUM(TotalMaidanHammali) AS Amount, BillDate
FROM         vw_BillExpenseSummary 
                      
GROUP BY BillDate
UNION ALL
SELECT     'Total-PalaKarai' AS expence, SUM(TotalPalaKarai) AS Amount, BillDate
FROM         vw_BillExpenseSummary 
                      
GROUP BY BillDate
UNION ALL
SELECT     'Total-OthersExp' AS expence, SUM(TotalOthersExp) AS Amount, BillDate
FROM         vw_BillExpenseSummary 
                      
GROUP BY BillDate

UNION ALL
SELECT     'Total-MotorBhada' AS expence, SUM(TotalGadiBhada) AS Amount, BillDate
FROM         vw_BillExpenseSummary 
                      
GROUP BY BillDate