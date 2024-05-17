create view [dbo].[vw_FarmerPhoneAndBankDetails]
as

SELECT a.AccountID
	,a.AccountFirmName
	,a.AccountName
	,a.AccountMobileNo
	,v.VillageName
	,abd.AccountBankDetailID
	,abd.AccountBankDetailNo
	,abd.fkAccountID
	,abd.BankAccountNo
	,abd.BranchNo
	,abd.BranchName
	,abd.IfscCode
	,abd.PanNo
	,abd.AccountHolderName
	,abd.Detail
	,abd.Comments
	,abd.IsShowonPage
	,abd.fkBranchID
	,abd.IsActive
	,abd.InsertDate
	,abd.ModifyDate
	,abd.CreatedBy
	,abd.ModifiedBy
	,abd.Sysdate
	
FROM Accounts AS a
inner join Villages v on
a.fkVillageID = v.VillageID
LEFT OUTER JOIN AccountBankDetails AS abd ON a.AccountID = abd.fkAccountID
WHERE (a.fkAccountTypeID = 7)
