CREATE VIEW [dbo].[vw_BillDetailv1]
AS
SELECT     dbo.Accounts.AccountID, dbo.BillDetails.BillDetailID, dbo.Bills.fkVillageID, dbo.BillDetails.NetWeight, dbo.Bills.BillID, dbo.Bills.BillNo, dbo.Accounts.AccountName, 
                      dbo.Bills.VillageName, dbo.Bills.BillPaidStatus, dbo.Bills.IsBillPrint, CONVERT(varchar(10), dbo.Bills.BillDate, 103) AS BillDate, dbo.Bills.BillDate AS BillDateActual, 
                      dbo.Bills.TransPortName, dbo.Bills.GadiNo, dbo.Bills.GadiBhada, dbo.Bills.PreviousBalance, dbo.BillDetails.SNo, dbo.BillDetails.ItemName, dbo.BillDetails.ItemUnit, 
                      dbo.BillDetails.ItemMarca, dbo.BillDetails.Quantity, dbo.BillDetails.BillRate, dbo.BillDetails.CommissionAmount, dbo.BillDetails.BillRate AS Expr1, 
                      dbo.BillDetails.BillGrossWeight, dbo.BillDetails.BillNetWeight, dbo.BillDetails.WeightDetails, dbo.BillDetails.BillTotalAmount, dbo.BillDetails.ActualTotalAmount, 
                      0 AS Sevasulk, 0 AS Innam, 0 AS CashAdvace, 2 AS Stationery, 0 AS Postage, 0 AS Other, dbo.BillDetails.AvgWeight, dbo.BillDetails.CommissionPercent, 
                      dbo.Bills.TotalSevaSulk, dbo.Bills.TotalHammali, dbo.Bills.TotalTulai, dbo.Bills.TotalKhadiKarai, dbo.Bills.TotalStationary, dbo.Bills.TotalPostageCharge, 
                      dbo.Bills.TotalDeduction, dbo.Bills.NetAmount, dbo.Bills.TotalAmount, dbo.Bills.PaidAmount, dbo.Bills.BalanceAmount, dbo.Bills.SalesTax, dbo.Bills.Discount, 
                      dbo.Bills.TotalBarwai, dbo.Bills.TotalMaidanHammali, dbo.Bills.TotalPalaKarai, dbo.Bills.TotalThelaBhada, dbo.Bills.TotalBardan, dbo.Bills.TotalAdvance, 
                      dbo.Bills.TotalOthersExp, dbo.Bills.TotalCommissionExp, 0 AS BankExpenses, 
                      dbo.Bills.TotalHammali + dbo.Bills.TotalTulai + dbo.Bills.TotalKhadiKarai + dbo.Bills.TotalBarwai + dbo.Bills.TotalMaidanHammali + dbo.Bills.TotalPalaKarai + dbo.Bills.TotalThelaBhada
                       + dbo.Bills.TotalBardan AS Option1, '' AS Option2, '' AS Option3, '' AS Option4, '' AS Option5, 
                      dbo.Bills.TotalHammali + dbo.Bills.TotalTulai + dbo.Bills.TotalKhadiKarai + dbo.Bills.TotalBarwai + dbo.Bills.TotalMaidanHammali + dbo.Bills.TotalPalaKarai + dbo.Bills.TotalThelaBhada
                       + dbo.Bills.TotalBardan AS totalexpence
FROM         dbo.Bills INNER JOIN
                      dbo.Accounts ON dbo.Bills.fkAccountID = dbo.Accounts.AccountID INNER JOIN
                      dbo.BillDetails ON dbo.Bills.BillID = dbo.BillDetails.fkBillID
WHERE     (dbo.Bills.IsActive <> '0') AND (dbo.Bills.IsCompanyAccount = 0)