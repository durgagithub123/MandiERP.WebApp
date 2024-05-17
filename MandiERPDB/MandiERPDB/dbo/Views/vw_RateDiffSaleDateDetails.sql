create view [dbo].[vw_RateDiffSaleDateDetails]
as
select fkBillDetailID,max( CreateDate) as SaleDate from ItemSaleDetails
group by fkBillDetailID
