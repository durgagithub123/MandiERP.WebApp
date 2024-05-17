CREATE proc [dbo].[Usp_UpsertItemSaleSummaryBill]
( @BillId bigint
)
as
begin
	declare @ItemSaleDetails table( fkAccountID bigint,CreateDate date)
	insert into @ItemSaleDetails 
		select distinct fkAccountID,CreateDate  from ItemSaleDetails where fkBillID = @BillId
		
		--select * from @ItemSaleDetails
		Declare @fkAccountID int = 0
		declare @BillDate datetime 
		set @BillDate = (select BillDate from Bills where BillID = @BillId)
		declare @Count int =0
		while (@fkAccountID is not null)
		begin
			set @fkAccountID = (select MIN(fkAccountID) from @ItemSaleDetails where fkAccountID > @fkAccountID)
			if (@fkAccountID is null)
				break;
				
			set @Count = (select COUNT(1) from @ItemSaleDetails where fkAccountID = @fkAccountID)
			set @BillDate = (select MIN(CreateDate) from @ItemSaleDetails where fkAccountID = @fkAccountID) 
			if (@Count > 0)
			begin	
				set @BillDate = @BillDate -1
				While @BillDate is not null 
				begin
					set @BillDate = (select Min(CreateDate) from @ItemSaleDetails where fkAccountID = @fkAccountID and CreateDate > @BillDate)
					if @BillDate is null
						break;
					 Exec [Usp_UpsertItemSaleSummary] @BillDate,@fkAccountID
					 select @BillDate,@fkAccountID
				end	
			
			end
			else
			begin
				--select @fkAccountID
				Exec [Usp_UpsertItemSaleSummary] @BillDate,@fkAccountID
				select @BillDate,@fkAccountID
			end
		end
end
GO
