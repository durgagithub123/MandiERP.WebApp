CREATE VIEW [dbo].[vw_BankAccountDetails]
AS
SELECT     dbo.Villages.VillageName, dbo.Accounts.AccountName, dbo.AccountBankDetails.BranchName, dbo.AccountBankDetails.BankAccountNo, dbo.AccountBankDetails.IfscCode, 
                      dbo.AccountBankDetails.fkAccountID, dbo.Accounts.IsActive, dbo.Accounts.fkAccountTypeID, dbo.Accounts.fkVillageID, dbo.Accounts.fkAccountBankDetailID, dbo.Accounts.AccountNameHindi, 
                      dbo.Accounts.AccountFirmName, dbo.Accounts.AccountSortName, dbo.Accounts.AccountMobileNo
FROM         dbo.AccountBankDetails INNER JOIN
                      dbo.Accounts ON dbo.AccountBankDetails.fkAccountID = dbo.Accounts.AccountID INNER JOIN
                      dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID
