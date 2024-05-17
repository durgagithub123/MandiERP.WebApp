Create proc [dbo].[UpdateCashBookID]
(
 @CashBooksID int 
)
as
begin

BEGIN TRY
    BEGIN TRANSACTION 

Update CashBooks Set IsActive = 0
where CashBookID = @CashBooksID
Update AccountTransactions Set IsActive = 0
where fkCashBookID = @CashBooksID

COMMIT
END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK
END CATCH
end
