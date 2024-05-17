create view [dbo].[vw_ExportCommission]
as
SELECT     sum(CommissionAmount) as CommissionAmountExport
FROM         ExportItemDetails
