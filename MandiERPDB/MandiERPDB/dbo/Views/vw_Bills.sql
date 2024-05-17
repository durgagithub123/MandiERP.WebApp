CREATE VIEW [dbo].[vw_Bills]
AS
SELECT     dbo.Accounts.AccountID, dbo.Accounts.AccountName, dbo.Bills.fkVillageID, dbo.BillDetails.NetWeight, dbo.Bills.VillageName, dbo.Bills.BillNo, dbo.Bills.BillPaidStatus, dbo.Bills.IsBillPrint, 
                      dbo.Bills.FirmPhoneNo, dbo.Bills.TotalStationary, CONVERT(VARCHAR(10), dbo.Bills.BillDate, 103) AS BillDate, dbo.Bills.TransPortName, dbo.Bills.GadiNo, dbo.Bills.GadiBhada, 
                      dbo.Bills.PreviousBalance, dbo.BillDetails.BillDetailID, dbo.BillDetails.SNo, dbo.BillDetails.ItemName, dbo.BillDetails.ItemUnit, dbo.BillDetails.ItemMarca, dbo.BillDetails.Quantity, 
                      dbo.BillDetails.BillRate, dbo.BillDetails.CommissionAmount, dbo.BillDetails.BillRate AS Expr1, dbo.BillDetails.BillGrossWeight, dbo.BillDetails.BillNetWeight, 
                      REPLACE(REPLACE(REPLACE(dbo.BillDetails.WeightDetails, '.00', ''), '.50', '.5'), ',', ', ') AS WeightDetails, dbo.BillDetails.TotalHammali, dbo.BillDetails.TotalTulai, dbo.BillDetails.TotalKhadiKari, 
                      dbo.BillDetails.BillTotalAmount, dbo.BillDetails.ActualTotalAmount, dbo.BillDetails.TotalWeightCutting, 0 AS Sevasulk, 0 AS Innam, 0 AS CashAdvace, dbo.Bills.TotalStationary AS Stationery, 
                      0 AS Postage, 0 AS Other, CONVERT(BIT, CASE WHEN Bills.BillPaidStatus = 'Cash' THEN 1 ELSE 0 END) AS PaidStatus, ISNULL
                          ((SELECT     TOP (1) 'Bank Name - ' + BranchName + '  A/C no - ' + BankAccountNo + '  IFSC - ' + IfscCode AS Expr1
                              FROM         dbo.AccountBankDetails
                              WHERE     (fkAccountID = dbo.Accounts.AccountID)), '') AS BankAccountCounter, ISNULL
                          ((SELECT     TOP (1) 'A/C no - ' + BankAccountNo + '| ' + 'IFSC - ' + IfscCode AS Expr1
                              FROM         dbo.AccountBankDetails AS AccountBankDetails_1
                              WHERE     (fkAccountID = dbo.Accounts.AccountID)), '') AS BankAccount, dbo.Bills.IsActive, dbo.Bills.IsCompanyAccount, dbo.Bills.fkAccountID, dbo.Bills.BillDate AS BillDateWF
FROM         dbo.Bills INNER JOIN
                      dbo.Accounts ON dbo.Bills.fkAccountID = dbo.Accounts.AccountID INNER JOIN
                      dbo.BillDetails ON dbo.Bills.BillID = dbo.BillDetails.fkBillID
WHERE     (dbo.Bills.IsActive <> '0')

GO