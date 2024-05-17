
CREATE view [dbo].[vw_BillTotalAmountCW]
as
--SELECT     fkBillID, sum(ISNULL( Quantity,0)) as Quantity, sum(isnull(ActualTotalAmount,0))-(sum(isnull(TotalHammali,0)) + sum(isnull(TotalTulai,0)) + 2)  as ActualTotalAmount
--FROM         BillDetails
--group by fkBillID


SELECT        BillDetails.fkBillID, SUM(ISNULL(BillDetails.Quantity, 0)) AS Quantity
, NetAmount AS ActualTotalAmount
FROM            BillDetails INNER JOIN
                         Bills ON BillDetails.fkBillID = Bills.BillID
--WHERE        (Bills.PreviousBalance > 0)
GROUP BY BillDetails.fkBillID, NetAmount
