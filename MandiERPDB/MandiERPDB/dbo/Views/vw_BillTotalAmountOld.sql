create view [dbo].[vw_BillTotalAmountOld]
as
SELECT     fkBillID, sum(ISNULL( Quantity,0)) as Quantity, sum(isnull(ActualTotalAmount,0)) as ActualTotalAmount
FROM         BillDetails
group by fkBillID
