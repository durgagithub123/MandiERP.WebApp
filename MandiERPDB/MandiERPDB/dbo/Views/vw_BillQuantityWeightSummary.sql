CREATE view [dbo].[vw_BillQuantityWeightSummary]
as
select fkBillID,
	sum(Quantity) as Quantity
	,sum(NetWeight) As NetWeight
	from BillDetails
	where IsActive != '0'
	group by fkBillID