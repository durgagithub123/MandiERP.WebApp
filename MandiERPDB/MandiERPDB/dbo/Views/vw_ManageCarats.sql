create view [dbo].[vw_ManageCarats]
as
SELECT     fkAccountID as AccountID
,sum( isnull( DebitCarat,0)) as Debit,sum( isnull( CreditCarat,0)) as Credit, sum( isnull( DebitCarat,0))-sum( isnull( CreditCarat,0)) as Balance
FROM         ManageCarats
group by fkAccountID
