CREATE view [dbo].[vw_BillExpenseSummary]
as

SELECT     Bills.BillDate, Bills.BillID, Bills.BillNo, BillExpenses.BillExpenseID, BillExpenses.BillExpenseNo, BillExpenses.BillExpenseCode, BillExpenses.fkBillID, BillExpenses.TotalGadiBhada, 
                      BillExpenses.TotalAdvance, BillExpenses.TotalHammali, BillExpenses.TotalTulai, BillExpenses.TotalBarwai, BillExpenses.TotalMaidanHammali, BillExpenses.TotalPalaKarai, 
                      BillExpenses.TotalThelaBhada, BillExpenses.TotalBardan, BillExpenses.TotalOthersExp, BillExpenses.TotalCommissionExp, BillExpenses.TotalMandiTax, BillExpenses.TotalLabourCharge, 
                      BillExpenses.TotalDhulaiCharge, BillExpenses.OtherExpense1, BillExpenses.OtherExpense2, BillExpenses.OtherExpense3, BillExpenses.OtherExpense4, BillExpenses.OtherExpense5, 
                      BillExpenses.Other1, BillExpenses.Other2, BillExpenses.Other3, BillExpenses.Other4, BillExpenses.Other5, BillExpenses.IsActive, BillExpenses.CreateBy, BillExpenses.CreateDate, 
                      BillExpenses.ModifyBy, BillExpenses.GatePassAmount, BillExpenses.StoreBhadaAmount, BillExpenses.DalaAmount
FROM         BillExpenses INNER JOIN
                      Bills ON BillExpenses.fkBillID = Bills.BillID
                      where bills.IsActive !='0'