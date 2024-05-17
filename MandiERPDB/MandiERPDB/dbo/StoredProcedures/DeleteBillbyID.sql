CREATE proc [dbo].[DeleteBillbyID]
(
 @BillID int 
)
as
begin
--declare @BillID int 
--set @BillID=33
--delete  from BalanceCarats order by BalanceCaratID desc
--delete  from BalanceHammalis order by BalanceHammaliID desc
--delete  from BalanceStocks order by BalanceStockID desc
--delete  from ManageAccounts order by ManageAccountID desc

-- Cash book Entry
BEGIN TRY
    BEGIN TRANSACTION 
delete  from ManageCarats 
where fkBillID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
delete  from ManageHammalis
where fkBillID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
delete  from ManageStocks
where fkBillDetailID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
delete  from ItemSaleDetails 
where fkBillDetailID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
delete  from BillDetails 
where BillDetailID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
delete  from Bills 
where BillID=@BillID

delete  from BillPayments 
where fkBillID =@BillID
COMMIT
END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK
END CATCH
end
