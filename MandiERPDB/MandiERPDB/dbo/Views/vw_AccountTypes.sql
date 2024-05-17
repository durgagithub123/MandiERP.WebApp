CREATE VIEW [dbo].[vw_AccountTypes]
AS
SELECT AccountTypeID
	,AccountTypeNo
	,AccountCode
	,AccountTypeName
	,AccountType
	,AccountTypeDetail
	,Comment
	,SubHeadDetail
	,IsBalanceKhata
	,IsShowonPage
	,fkBranchID
	,IsActive
	,CreateBy
	,CreateDate
	,ModifyBy
	,ModifyDate
FROM AccountTypes
WHERE [AccountTypeID] IN (
		1
		,7
		,17
		,24
		,25
		,14
		)

