Create proc [dbo].[usp_UpdateTransactionAfterExport]
@ExportMasterID int = 0

as
begin
	declare @tbl table(Id int identity,AccountID int ,ItemSaleDetailID int)
	insert into @tbl
		select [AccountID],[ItemSaleDetailID] from [dbo].[vw_ExportItem]
		where AccountID = (select top 1 CompanyAccountID from Configurations) and RemainQty <= 0
		and [ItemSaleDetailID] in (select fkItemSaleDetailID from ExportItemDetails
			where @ExportMasterID = 0 or   fkExportMasterID = @ExportMasterID)

	update AccountTransactions
	set IsActive = '0', TransactionDetail ='Auto Inactive on Export'
	from AccountTransactions AT inner join @tbl T on AT.fkAccountID =T.AccountID
	and AT.fkItemSaleDetailID= T.ItemSaleDetailID
	and AT.IsActive !=  '0'
end
