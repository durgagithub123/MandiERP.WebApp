CREATE view [dbo].[vw_ManageAccountTransaction]
as

SELECT     fkAccountID as AccountID ,sum( isnull( DebitAmount,0)) as Debit,sum( isnull( CreditAmount,0)) as Credit, sum( isnull( DebitAmount,0))-sum( isnull( CreditAmount,0)) as Balance
FROM         AccountTransactions
group by fkAccountID
