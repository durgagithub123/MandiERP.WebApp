CREATE view [dbo].[vw_CashBookReceipt]
as

with CTE(AccountID,AccountName,CreditAmount,DebitAmount,Balance)
as (
SELECT dbo.accounts.AccountID
		,dbo.Accounts.AccountName
		,SUM(dbo.AccountTransactions.CreditAmount) AS CreditAmount
		,SUM(dbo.AccountTransactions.DebitAmount) AS DebitAmount
		,ISNULL(SUM(dbo.AccountTransactions.CreditAmount), 0) - ISNULL(SUM(dbo.AccountTransactions.DebitAmount), 0) AS Balance
	--,null
	FROM dbo.AccountTransactions
	INNER JOIN dbo.Accounts ON dbo.AccountTransactions.fkAccountID = dbo.Accounts.AccountID
	Left Join CashBooks cb on cb.CashBookID = AccountTransactions.fkCashBookID and cb.fkAccountID = Accounts.AccountID
	WHERE AccountTransactions.IsActive != '0' --and cb.CashBookID =  35
	GROUP BY dbo.Accounts.AccountID
		,dbo.Accounts.AccountName
		,dbo.Accounts.fkAccountTypeID
		
		)
		select cb.CashBookID,cb.CashBookNo,cb.VoucherNo,cb.TransactionDate,
		c.AccountID,c.AccountName
		
				--, c.*
			--,c.DebitAmount- cb.DebitAmount as DebitBalance
			--,c.CreditAmount -cb.CreditAmount  as CreditBalance
			, Case when cb.DebitAmount > 0 then cb.DebitAmount + c.Balance else c.Balance - cb.CreditAmount end  as PreviousAmount
		 ,cb.CreditAmount
		 ,cb.DebitAmount
		 ,case when cb.CreditAmount > 0 then cb.CreditAmount else cb.DebitAmount end as CashBookAmount
		 ,c.Balance as OutStanding
		 from CTE c
		inner join CashBooks cb on 
			cb.fkAccountID = c.AccountID	
			where cb.IsActive != '0'



