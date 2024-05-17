CREATE VIEW [dbo].[vw_CashBookIndb]
AS
SELECT     a.AccountName, a.AccountID, cb.CashBookID, cb.CashBookNo, cb.CashBookCode, cb.CashBookDetail, cb.VoucherNo, cb.VoucherType, cb.CashorBankAccount, cb.ChequeNo, cb.RecieptType, 
                      cb.fkAccountID, cb.fkAccountType, cb.fkVillageID, cb.VillageName, cb.IsCompanyAccount, cb.AccountHolder, cb.TransactionDate, cb.TransactionDetail, cb.Folio, cb.DebitAmount, cb.CreditAmount, 
                      cb.IsDebitOrCredit, cb.BalanceAmount, cb.Remark, cb.Comment, cb.fkBranchID, cb.IsActive, cb.InsertDate, cb.ModifyDate, cb.CreatedBy, cb.ModifiedBy, cb.fkAccountIDBook, 
                      ab.AccountFirmName AS BankAccountFirmName, ab.AccountName AS BankAccountName
                      ,a.fkAccountTypeID
FROM         dbo.Accounts AS a INNER JOIN
                      dbo.CashBooks AS cb ON a.AccountID = cb.fkAccountID LEFT OUTER JOIN
                      dbo.Accounts AS ab ON ab.AccountID = cb.fkAccountIDBook
--where a.fkAccountTypeID != 14