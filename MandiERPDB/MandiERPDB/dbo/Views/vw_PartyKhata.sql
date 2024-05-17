CREATE VIEW [dbo].[vw_PartyKhata]
AS
SELECT     fkAccountID, TransactionDate, NetWeight, Quantity, CreditAmount, DebitAmount, IsDebitOrCredit, '' AS Remark, fkAccountTypeID,AccountName
FROM         vw_PartyKhata1
UNION
SELECT     fkAccountID, TransactionDate, NetWeight, Quantity, CreditAmount, DebitAmount, IsDebitOrCredit, Remark, fkAccountTypeID,AccountName
FROM         vw_PartyKhata3
