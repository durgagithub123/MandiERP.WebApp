CREATE view [dbo].[vw_BillTotalAmountReport]
as
SELECT     vw_BillTotalAmount.fkBillID, vw_BillTotalAmount.Quantity, vw_BillTotalAmount.ActualTotalAmount, vw_BillTotalPaidAmount.PaidAmount,
vw_BillTotalAmount.ActualTotalAmount- isnull(vw_BillTotalPaidAmount.PaidAmount,0) as RemainingAmount

FROM         vw_BillTotalAmount left JOIN
                      vw_BillTotalPaidAmount ON vw_BillTotalAmount.fkBillID = vw_BillTotalPaidAmount.fkBillID
