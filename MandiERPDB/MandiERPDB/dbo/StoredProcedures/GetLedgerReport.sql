/*
-- Add the parameters for the stored procedure here
--Execute Statement
EXEC [dbo].[GetLedgerReport]
 @AccountID INT = '42'
 
	 
*/
 

CREATE PROCEDURE [dbo].[GetLedgerReport]
	 @AccountID INT = null
	--,@billdetailid INT = null
	--,@transactiondate DATETIME = null
	
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
	    SELECT dbo.Accounts.fkVillageID
    ,dbo.AccountTransactions.AccountTransactionID
    ,dbo.Accounts.AccountID
    ,dbo.Accounts.AccountFirmName
    ,dbo.Accounts.AccountFirmNameHindi
    ,dbo.Accounts.AccountSortName
    ,dbo.Accounts.AccountName
    ,dbo.Accounts.AccountNameHindi
    ,dbo.Accounts.AccountMobileNo
    ,dbo.AccountTransactions.VoucherNo
    ,dbo.AccountTransactions.ChequeNo
    ,dbo.AccountTransactions.RecieptType

    ,dbo.AccountTransactions.TransactionDate
    ,dbo.AccountTransactions.TransactionDetail
    ,dbo.AccountTransactions.Folio
    ,dbo.AccountTransactions.DebitAmount
    ,dbo.AccountTransactions.CreditAmount
    ,dbo.AccountTransactions.IsDebitOrCredit
    ,dbo.AccountTransactions.Remark
    ,dbo.AccountTransactions.Comment
    ,dbo.AccountTransactions.fkBranchID
    ,dbo.Villages.VillageName
    ,dbo.AccountTransactions.IsActive
    ,dbo.Accounts.fkAccountTypeID
    ,dbo.AccountTransactions.fkBillID
    ,dbo.AccountTransactions.fkBillDetailID
    ,dbo.AccountTransactions.fkExportMasterID
    ,dbo.AccountTransactions.fkExportItemDetailID
    ,dbo.AccountTransactions.fkItemSaleDetailID

    , bd.Quantity
    ,bd.ItemName
    ,bd.ItemMarca
    ,bd.ActualTotalAmount
FROM dbo.Accounts
INNER JOIN dbo.AccountTransactions ON dbo.Accounts.AccountID = dbo.AccountTransactions.fkAccountID
LEFT OUTER JOIN dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID
left join BillDetails bd on 
    bd.BillDetailID = AccountTransactions.fkBillDetailID
	END TRY
    BEGIN CATCH
        PRINT 'hhhh';
    END CATCH
END;
