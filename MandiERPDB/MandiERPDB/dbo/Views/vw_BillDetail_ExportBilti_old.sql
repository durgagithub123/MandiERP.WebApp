CREATE VIEW [dbo].[vw_BillDetail_ExportBilti_old]
AS
SELECT     AccountsBill.AccountID, ItemSaleDetails.ItemSaleDetailID ,Bills.fkVillageID, BillDetails.NetWeight, Bills.BillID, Bills.BillNo, AccountsBill.AccountName, Bills.VillageName, Bills.BillPaidStatus, 
                      Bills.IsBillPrint, CONVERT(varchar(10), Bills.BillDate, 103) AS BillDate, Bills.BillDate AS BillDateActual, Bills.TransPortName, Bills.GadiNo, Bills.GadiBhada, 
                      Bills.PreviousBalance, BillDetails.BillDetailID, BillDetails.SNo, BillDetails.ItemName, BillDetails.ItemUnit, BillDetails.ItemMarca, BillDetails.Quantity, 
                      BillDetails.BillRate, BillDetails.CommissionAmount, BillDetails.BillRate AS Expr1, BillDetails.BillGrossWeight, BillDetails.BillNetWeight, BillDetails.WeightDetails, 
                      BillDetails.TotalHammali, BillDetails.TotalTulai, BillDetails.TotalKhadiKari, BillDetails.BillTotalAmount, BillDetails.ActualTotalAmount, BillDetails.TotalWeightCutting, 
                      0 AS Sevasulk, 0 AS Innam, 0 AS CashAdvace, 0 AS Stationery, 0 AS Postage, 0 AS Other,  AccountsSales.AccountFirmName, 
                      AccountsSales.AccountFirmNameHindi, AccountsSales.AccountSortName, AccountsSales.AccountName AS AccountNameAccountSales
FROM         Bills INNER JOIN
                      Accounts AS AccountsBill ON Bills.fkAccountID = AccountsBill.AccountID INNER JOIN
                      BillDetails ON Bills.BillID = BillDetails.fkBillID INNER JOIN
                      ItemSaleDetails ON BillDetails.BillDetailID = ItemSaleDetails.fkBillDetailID INNER JOIN
                      Accounts AS AccountsSales ON Bills.fkAccountID = AccountsSales.AccountID
