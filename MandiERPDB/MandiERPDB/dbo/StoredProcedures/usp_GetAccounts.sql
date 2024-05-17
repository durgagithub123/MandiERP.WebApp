CREATE proc [dbo].[usp_GetAccounts]
@AccountName varchar(500),
@VillageID int
as
begin
		;with CTE as (select distinct fkAccountID from AccountTransactions)

	   Select   distinct
            AccountID, +
            AccountName + ' '+ villages.VillageName as AccountNamewithVillage 
            ,AccountName + ' '+ villages.VillageName + '  #!#' + Convert(varchar(50),AccountID) as AccountNameWithID 

             From Accounts inner Join Villages on Villages.VillageID= Accounts.fkVillageID
				left join CTE b on b.fkAccountID = Accounts.AccountID
             where (@AccountName = '' or AccountName like '%' +@AccountName+'%')
				and (@VillageID = 0 or VillageID = @VillageID)
				and Accounts.fkAccountTypeID  is not null
				and (b.fkAccountID is not null)
             --order by AccountName Asc
end