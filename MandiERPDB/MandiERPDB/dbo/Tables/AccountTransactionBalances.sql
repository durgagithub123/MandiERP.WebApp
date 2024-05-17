CREATE TABLE [dbo].[AccountTransactionBalances] (
    [AccountTransactionBalanceID] BIGINT     IDENTITY (1, 1) NOT NULL,
    [AccountTransactionLedgerNo]  BIGINT     NULL,
    [fkAccountID]                 BIGINT     NULL,
    [Credit]                      FLOAT (53) NULL,
    [Debit]                       FLOAT (53) NULL,
    [Ledger]                      FLOAT (53) NULL,
    [LastUpdated]                 DATETIME   CONSTRAINT [DF_AccountTransactionBalances_LastUpdated] DEFAULT (getdate()) NULL,
    [Sysdate]                     DATETIME   CONSTRAINT [DF_AccountTransactionBalances_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_AccountTransactionBalances_AccountTransactionBalanceID] PRIMARY KEY CLUSTERED ([AccountTransactionBalanceID] ASC),
    CONSTRAINT [FK_AccountTransactionBalances_Accounts_fkAccountID] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);

