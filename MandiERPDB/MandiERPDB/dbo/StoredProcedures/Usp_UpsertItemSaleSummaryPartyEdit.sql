CREATE proc [dbo].[Usp_UpsertItemSaleSummaryPartyEdit]
( @fkAccountID bigint,
  @ItemSaleDetailID bigint
)
as
begin
		declare @TransactionDate datetime 
		set @TransactionDate = (select CreateDate from ItemSaleDetails where ItemSaleDetailID = @ItemSaleDetailID)
		select @TransactionDate
		Exec [Usp_UpsertItemSaleSummary] @TransactionDate=@TransactionDate,@fkAccountID=@fkAccountID
		
		
		
end