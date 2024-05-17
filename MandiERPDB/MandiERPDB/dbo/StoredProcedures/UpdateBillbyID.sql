create proc [dbo].[UpdateBillbyID]
(
 @BillID int 
)
as
begin

BEGIN TRY
    BEGIN TRANSACTION 
Update ManageCarats Set IsActive = 0
where fkBillID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
Update ManageHammalis Set IsActive = 0
where fkBillID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
Update  ManageStocks Set IsActive = 0
where fkBillDetailID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
Update ItemSaleDetails Set IsActive = 0
where fkBillDetailID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)
Update BillDetails Set IsActive = 0
where BillDetailID in (select billdetailID from BillDetails bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)

Update Bills Set IsActive = 0
where BillID=@BillID

Update BillPayments Set IsActive = 0
where fkBillID in (select BillPaymentID from BillPayments bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)

Update AccountTransactions Set IsActive = 0
where AccountTransactionID in (select AccountTransactionID from AccountTransactions bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)

Update CashBooks Set IsActive = 0
where CashBookID in (select CashBookID from CashBooks bd inner join Bills b on b.BillID=bd.fkBillID where b.BillID=@BillID)

COMMIT
END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK
END CATCH
end
