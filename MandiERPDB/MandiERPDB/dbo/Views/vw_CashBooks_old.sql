CREATE view [dbo].[vw_CashBooks_old]
as

SELECT     Accounts.AccountName, Accounts.AccountID, CashBooks.CashBookID, CashBooks.CashBookNo, CashBooks.CashBookCode, CashBooks.CashBookDetail, CashBooks.VoucherNo, 
                      CashBooks.VoucherType, CashBooks.CashorBankAccount, CashBooks.ChequeNo, CashBooks.RecieptType, CashBooks.fkAccountID, CashBooks.fkAccountType, CashBooks.fkVillageID, 
                      CashBooks.VillageName, CashBooks.IsCompanyAccount, CashBooks.AccountHolder, CashBooks.TransactionDate, CashBooks.TransactionDetail, CashBooks.Folio, CashBooks.DebitAmount, 
                      CashBooks.CreditAmount, CashBooks.IsDebitOrCredit, CashBooks.BalanceAmount, CashBooks.Remark, CashBooks.Comment, CashBooks.fkBranchID, CashBooks.IsActive, CashBooks.InsertDate, 
                      CashBooks.ModifyDate, CashBooks.CreatedBy, CashBooks.ModifiedBy
FROM         Accounts INNER JOIN
                      CashBooks ON Accounts.AccountID = CashBooks.fkAccountID
