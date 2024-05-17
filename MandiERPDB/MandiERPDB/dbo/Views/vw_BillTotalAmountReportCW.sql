
create VIEW [dbo].[vw_BillTotalAmountReportCW]
AS
SELECT vw_BillTotalAmount.fkBillID
	,vw_BillTotalAmount.Quantity
	,vw_BillTotalAmount.ActualTotalAmount
	,vw_BillTotalPaidAmount.PaidAmount
	,vw_BillTotalAmount.ActualTotalAmount - isnull(vw_BillTotalPaidAmount.PaidAmount, 0) AS RemainingAmount
FROM [vw_BillTotalAmountCW] as vw_BillTotalAmount
LEFT JOIN vw_BillTotalPaidAmount ON vw_BillTotalAmount.fkBillID = vw_BillTotalPaidAmount.fkBillID
