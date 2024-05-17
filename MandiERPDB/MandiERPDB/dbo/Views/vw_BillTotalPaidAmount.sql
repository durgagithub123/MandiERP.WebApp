create view [dbo].[vw_BillTotalPaidAmount]
as

SELECT     fkBillID, sum(isnull(PaidAmount,0)) as PaidAmount
FROM         BillPayments
group by fkBillID
