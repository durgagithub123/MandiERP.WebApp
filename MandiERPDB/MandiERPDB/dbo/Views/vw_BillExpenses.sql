CREATE VIEW vw_BillExpenses
AS
SELECT fkBillID as fkBillID,  
      SUM([TotalGadiBhada]) +
      SUM([TotalAdvance]) +
      SUM([TotalHammali]) +
      SUM([TotalTulai]) +
      SUM([TotalBarwai]) +
      SUM([TotalMaidanHammali]) +
      SUM([TotalPalaKarai]) +
      SUM([TotalThelaBhada]) +
      SUM([TotalBardan]) +
      SUM([TotalOthersExp]) +
      SUM([TotalCommissionExp]) +
      SUM([TotalMandiTax]) +
      SUM([TotalLabourCharge]) +
      SUM([TotalDhulaiCharge]) +
      SUM([OtherExpense1]) +
      SUM([OtherExpense2]) +
      SUM([OtherExpense3]) +
      SUM([OtherExpense4]) +
      SUM([OtherExpense5]) +
      SUM([GatePassAmount]) +
      SUM([StoreBhadaAmount]) +
      SUM([DalaAmount]) as TotalDeduction
  FROM [BillExpenses] where IsActive != '0'
  GROUP BY fkBillID