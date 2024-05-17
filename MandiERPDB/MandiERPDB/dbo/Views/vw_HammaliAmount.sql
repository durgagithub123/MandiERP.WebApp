create view [dbo].[vw_HammaliAmount]
as
SELECT      fkAccountID as AccountID ,sum(DebitHammali) as DebitHammali , sum(CreditHammali) as CreditHammali
,sum(DebitHammali)-sum(CreditHammali) as BalanceHammali
FROM         ManageHammalis
group by fkAccountID
