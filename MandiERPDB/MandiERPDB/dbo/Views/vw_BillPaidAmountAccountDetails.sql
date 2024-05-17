CREATE view [dbo].[vw_BillPaidAmountAccountDetails]
as
SELECT     Bills.BillID, Bills.BillNo, Accounts.AccountID, Accounts.AccountFirmName, Accounts.AccountFirmNameHindi, Accounts.AccountSortName, Accounts.AccountName, 
                      Bills.fkVillageID, Villages.VillageID, Villages.VillageName, Bills.BillDate, Bills.BillPaidStatus, Bills.IsBillPrint
FROM         Accounts INNER JOIN
                      Bills ON Accounts.AccountID = Bills.fkAccountID INNER JOIN
                      Villages ON Bills.fkVillageID = Villages.VillageID
                      where Bills.IsCompanyAccount Not in(1) and Bills.IsActive != '0'
