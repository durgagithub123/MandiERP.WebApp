CREATE view [dbo].[vw_BillTotalAmount]
as
--SELECT     fkBillID, sum(ISNULL( Quantity,0)) as Quantity, sum(isnull(ActualTotalAmount,0))-(sum(isnull(TotalHammali,0)) + sum(isnull(TotalTulai,0)) + 2)  as ActualTotalAmount
--FROM         BillDetails
--group by fkBillID


SELECT        BillDetails.fkBillID, SUM(ISNULL(BillDetails.Quantity, 0)) AS Quantity
, SUM(ISNULL(BillDetails.ActualTotalAmount, 0)) -
 (SUM(ISNULL(BillDetails.TotalHammali, 0)) + SUM(ISNULL(BillDetails.TotalTulai, 0)) 
 + isnull(Bills.TotalStationary,0) + ISNULL(Bills.PreviousBalance,0) + isnull(bills.GadiBhada,0) ) 
                         AS ActualTotalAmount
FROM            BillDetails INNER JOIN
                         Bills ON BillDetails.fkBillID = Bills.BillID
--WHERE        (Bills.PreviousBalance > 0)
GROUP BY BillDetails.fkBillID, Bills.PreviousBalance, Bills.TotalStationary,bills.GadiBhada
