
CREATE VIEW [dbo].[vw_AccountsSaleAmount]
AS
SELECT AccountID
	,DebitAmount
	,CreditAmount
	,TransactionDate
	,Remark
	,TransactionDetail
	,'1' AS IsSale
FROM dbo.vw_AccountTransactions at
WHERE (
		(
			TransactionDetail = 'Auto'
			AND DebitAmount > 0
			)
		OR (
			TransactionDetail = 'CB'
			AND CreditAmount > 0
			)
		)
union

SELECT AccountID
	,DebitAmount
	,CreditAmount
	,TransactionDate
	,Remark
	,TransactionDetail
	,'0' AS IsSale
FROM dbo.vw_AccountTransactions at
WHERE (
		(
			TransactionDetail = 'Auto'
			AND CreditAmount > 0
			)
		OR (
			TransactionDetail = 'CB'
			AND DebitAmount > 0
			)
		)

		
		
		
		
