CREATE VIEW [dbo].[vw_PartyKhata1]
AS
SELECT ItemSaleDetails.fkAccountID
	,ItemSaleDetails.CreateDate AS TransactionDate
	,SUM(ItemSaleDetails.NetWeight) AS NetWeight
	,SUM(ItemSaleDetails.Quantity) AS Quantity
	,CASE Accounts.fkAccountTypeID
		WHEN 2
			THEN SUM(ItemSaleDetails.TotalAmount)
		ELSE 0
		END AS CreditAmount
	,CASE Accounts.fkAccountTypeID
		WHEN 2
			THEN 0
		ELSE SUM(ItemSaleDetails.TotalAmount)
		END AS DebitAmount
	,CASE Accounts.fkAccountTypeID
		WHEN 2
			THEN 'C'
		ELSE 'D'
		END AS IsDebitOrCredit
	,Accounts.fkAccountTypeID
	,Accounts.AccountName
FROM ItemSaleDetails
INNER JOIN Accounts ON ItemSaleDetails.fkAccountID = Accounts.AccountID
	AND (dbo.ItemSaleDetails.IsActive <> '0')
	AND Accounts.fkAccountTypeID != 2
GROUP BY ItemSaleDetails.fkAccountID
	,Accounts.AccountName
	,Accounts.fkAccountTypeID
	,Accounts.AccountName
	,ItemSaleDetails.CreateDate
