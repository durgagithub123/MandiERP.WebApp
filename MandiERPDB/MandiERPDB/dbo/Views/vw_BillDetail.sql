CREATE view [dbo].[vw_BillDetail]
AS
SELECT     dbo.Accounts.AccountID, dbo.BillDetails.BillDetailID, dbo.Bills.fkVillageID, dbo.BillDetails.NetWeight, dbo.Bills.BillID, dbo.Bills.BillNo, dbo.Accounts.AccountName, 
                      dbo.Bills.VillageName, dbo.Bills.BillPaidStatus, dbo.Bills.IsBillPrint, CONVERT(varchar(10), dbo.Bills.BillDate, 103) AS BillDate, dbo.Bills.BillDate AS BillDateActual, 
                      dbo.Bills.TransPortName, dbo.Bills.GadiNo, dbo.Bills.GadiBhada, dbo.Bills.PreviousBalance, dbo.BillDetails.SNo, dbo.BillDetails.ItemName, dbo.BillDetails.ItemUnit, 
                      dbo.BillDetails.ItemMarca, dbo.BillDetails.Quantity, dbo.BillDetails.BillRate, dbo.BillDetails.CommissionAmount, dbo.BillDetails.BillRate AS Expr1, 
                      dbo.BillDetails.BillGrossWeight, dbo.BillDetails.BillNetWeight, dbo.BillDetails.WeightDetails, dbo.BillDetails.TotalHammali, dbo.BillDetails.TotalTulai, 
                      dbo.BillDetails.TotalKhadiKari, dbo.BillDetails.BillTotalAmount, dbo.BillDetails.ActualTotalAmount, dbo.BillDetails.TotalWeightCutting, 0 AS Sevasulk, 0 AS Innam, 
                      0 AS CashAdvace, 2 AS Stationery, 0 AS Postage, 0 AS Other
					  
FROM         dbo.Bills INNER JOIN
                      dbo.Accounts ON dbo.Bills.fkAccountID = dbo.Accounts.AccountID INNER JOIN
                      dbo.BillDetails ON dbo.Bills.BillID = dbo.BillDetails.fkBillID
                      where Bills.IsActive!='0' AND BillDetails.IsActive != '0' and Bills.IsCompanyAccount=0
