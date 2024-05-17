CREATE VIEW [dbo].[vw_LedgerDetails]
AS
SELECT     TransactionDate, AccountName, Remark, VoucherNo, DebitAmount, CreditAmount, ItemName, ItemMarca, Quantity, ActualTotalAmount, BillRate, NetWeight, AccountTransactionID, AccountID, 
                      AccountFirmName, fkVillageID, IsActive
FROM         (SELECT     dbo.Accounts.fkVillageID, dbo.AccountTransactions.AccountTransactionID, dbo.Accounts.AccountID, dbo.Accounts.AccountFirmName, dbo.Accounts.AccountFirmNameHindi, 
                                              dbo.Accounts.AccountSortName, dbo.Accounts.AccountName, dbo.Accounts.AccountNameHindi, dbo.Accounts.AccountMobileNo, dbo.AccountTransactions.VoucherNo, 
                                              dbo.AccountTransactions.ChequeNo, dbo.AccountTransactions.RecieptType, dbo.AccountTransactions.TransactionDate, dbo.AccountTransactions.TransactionDetail, 
                                              dbo.AccountTransactions.Folio, dbo.AccountTransactions.DebitAmount, dbo.AccountTransactions.CreditAmount, dbo.AccountTransactions.IsDebitOrCredit, 
                                              dbo.AccountTransactions.Remark, dbo.AccountTransactions.Comment, dbo.AccountTransactions.fkBranchID, dbo.Villages.VillageName, dbo.AccountTransactions.IsActive, 
                                              dbo.Accounts.fkAccountTypeID, dbo.AccountTransactions.fkBillID, dbo.AccountTransactions.fkBillDetailID, dbo.AccountTransactions.fkExportMasterID, 
                                              dbo.AccountTransactions.fkExportItemDetailID, dbo.AccountTransactions.fkItemSaleDetailID, bd.Quantity, bd.ItemName, bd.ItemMarca, bd.ActualTotalAmount, bd.BillRate, 
                                              bd.NetWeight
                       FROM          dbo.Accounts INNER JOIN
                                              dbo.AccountTransactions ON dbo.Accounts.AccountID = dbo.AccountTransactions.fkAccountID INNER JOIN
                                              dbo.Villages ON dbo.Accounts.fkVillageID = dbo.Villages.VillageID INNER JOIN
                                              dbo.Bills AS b ON b.BillID = dbo.AccountTransactions.fkBillID AND b.fkAccountID = dbo.AccountTransactions.fkAccountID INNER JOIN
                                              dbo.BillDetails AS bd ON bd.BillDetailID = dbo.AccountTransactions.fkBillDetailID
                       UNION ALL
                       SELECT     Accounts_1.fkVillageID, AccountTransactions_1.AccountTransactionID, Accounts_1.AccountID, Accounts_1.AccountFirmName, Accounts_1.AccountFirmNameHindi, 
                                             Accounts_1.AccountSortName, Accounts_1.AccountName, Accounts_1.AccountNameHindi, Accounts_1.AccountMobileNo, AccountTransactions_1.VoucherNo, 
                                             AccountTransactions_1.ChequeNo, AccountTransactions_1.RecieptType, AccountTransactions_1.TransactionDate, AccountTransactions_1.TransactionDetail, AccountTransactions_1.Folio, 
                                             AccountTransactions_1.DebitAmount, AccountTransactions_1.CreditAmount, AccountTransactions_1.IsDebitOrCredit, AccountTransactions_1.Remark, AccountTransactions_1.Comment, 
                                             AccountTransactions_1.fkBranchID, Villages_1.VillageName, AccountTransactions_1.IsActive, Accounts_1.fkAccountTypeID, AccountTransactions_1.fkBillID, 
                                             AccountTransactions_1.fkBillDetailID, AccountTransactions_1.fkExportMasterID, AccountTransactions_1.fkExportItemDetailID, AccountTransactions_1.fkItemSaleDetailID, isd.Quantity, 
                                             bd.ItemName, bd.ItemMarca, isd.TotalAmount, isd.Rate, isd.NetWeight
                       FROM         dbo.Accounts AS Accounts_1 INNER JOIN
                                             dbo.AccountTransactions AS AccountTransactions_1 ON Accounts_1.AccountID = AccountTransactions_1.fkAccountID INNER JOIN
                                             dbo.Villages AS Villages_1 ON Accounts_1.fkVillageID = Villages_1.VillageID INNER JOIN
                                             dbo.ItemSaleDetails AS isd ON isd.ItemSaleDetailID = AccountTransactions_1.fkItemSaleDetailID AND isd.fkAccountID = AccountTransactions_1.fkAccountID INNER JOIN
                                             dbo.BillDetails AS bd ON bd.BillDetailID = isd.fkBillDetailID
                       UNION ALL
                       SELECT     Accounts_2.fkVillageID, AccountTransactions_2.AccountTransactionID, Accounts_2.AccountID, Accounts_2.AccountFirmName, Accounts_2.AccountFirmNameHindi, 
                                             Accounts_2.AccountSortName, Accounts_2.AccountName, Accounts_2.AccountNameHindi, Accounts_2.AccountMobileNo, AccountTransactions_2.VoucherNo, 
                                             AccountTransactions_2.ChequeNo, AccountTransactions_2.RecieptType, AccountTransactions_2.TransactionDate, AccountTransactions_2.TransactionDetail, AccountTransactions_2.Folio, 
                                             AccountTransactions_2.DebitAmount, AccountTransactions_2.CreditAmount, AccountTransactions_2.IsDebitOrCredit, AccountTransactions_2.Remark, AccountTransactions_2.Comment, 
                                             AccountTransactions_2.fkBranchID, Villages_1.VillageName, AccountTransactions_2.IsActive, Accounts_2.fkAccountTypeID, AccountTransactions_2.fkBillID, 
                                             AccountTransactions_2.fkBillDetailID, AccountTransactions_2.fkExportMasterID, AccountTransactions_2.fkExportItemDetailID, AccountTransactions_2.fkItemSaleDetailID, '0' AS Quantity, 
                                             '' AS ItemName, '' AS ItemMarca, '0' AS TotalAmount, '0' AS Rate, '0' AS NetWeight
                       FROM         dbo.Accounts AS Accounts_2 INNER JOIN
                                             dbo.AccountTransactions AS AccountTransactions_2 ON Accounts_2.AccountID = AccountTransactions_2.fkAccountID INNER JOIN
                                             dbo.Villages AS Villages_1 ON Accounts_2.fkVillageID = Villages_1.VillageID INNER JOIN
                                             dbo.CashBooks ON Accounts_2.AccountID = dbo.CashBooks.fkAccountID AND AccountTransactions_2.fkCashBookID = dbo.CashBooks.CashBookID) AS LEGER
GO
