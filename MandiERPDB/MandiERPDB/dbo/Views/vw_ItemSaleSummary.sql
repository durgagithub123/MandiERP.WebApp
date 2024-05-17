CREATE VIEW [dbo].[vw_ItemSaleSummary]
AS
SELECT     dbo.ItemSaleSummary.TransactionDate, dbo.Accounts.AccountName, dbo.Villages.VillageName, dbo.ItemSaleSummary.CommissionAmount, dbo.ItemSaleSummary.TotalAmount, 
                      dbo.ItemSaleSummary.PaidAmount, dbo.ItemSaleSummary.RemainingAmount, dbo.ItemSaleSummary.IsPanaPaid
FROM         dbo.Accounts INNER JOIN
                      dbo.ItemSaleSummary ON dbo.Accounts.AccountID = dbo.ItemSaleSummary.fkAccountID INNER JOIN
                      dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID