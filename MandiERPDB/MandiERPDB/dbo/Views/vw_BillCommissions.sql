create view [dbo].[vw_BillCommissions]
as
SELECT     sum(CommissionAmount) as CommissionAmount
FROM         ItemSaleDetails
