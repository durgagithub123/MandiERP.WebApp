create view [dbo].[vw_ManageHammali]
as
SELECT      fkAccountID as AccountID ,sum( isnull(DebitHammali,0)) as Debit , sum(isnull(CreditHammali,0)) as Credit
,sum(isnull(DebitHammali,0))-sum(isnull(CreditHammali,0)) as Balance
FROM         ManageHammalis
group by fkAccountID
