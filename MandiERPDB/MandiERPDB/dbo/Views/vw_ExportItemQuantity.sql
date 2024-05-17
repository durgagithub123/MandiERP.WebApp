Create view vw_ExportItemQuantity
as
select
	ed.fkItemSaleDetailID
	,SUM(ed.AcutualQuantity) as TotalQuantityInExport
	from ItemSaleDetails isd 
	inner join ExportItemDetails ed on
	isd.ItemSaleDetailID = ed.fkItemSaleDetailID
	where isd.IsActive != '0' and ed.IsActive !='0'
	group by ed.fkItemSaleDetailID