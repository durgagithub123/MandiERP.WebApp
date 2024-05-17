CREATE TABLE [dbo].[AccountTransactionLedgers] (
    [AccountTransactionLedgerID] BIGINT       IDENTITY (1, 1) NOT NULL,
    [AccountTransactionLedgerNo] BIGINT       NULL,
    [fkAccountID]                BIGINT       NULL,
    [IsCompanyAccount]           VARCHAR (50) NULL,
    [LedgerBalance]              INT          NULL,
    [TransactionDate]            DATETIME     NULL,
    [fkBranchID]                 INT          NULL,
    [IsActive]                   VARCHAR (20) CONSTRAINT [DF_AccountTransactionLedgers_IsActive]  DEFAULT ('Active') NULL,
    [InsertDate]                 DATETIME     CONSTRAINT [DF_AccountTransactionLedgers_InsertDate]  DEFAULT (getdate()) NULL,
    [ModifyDate]                 DATETIME     NULL,
    [CreatedBy]                  INT          NULL,
    [ModifiedBy]                 INT          NULL,
    [Sysdate]                    DATETIME     CONSTRAINT [DF_AccountTransactionLedgers_Sysdate]  DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_AccountTransactionLedgers_AccountTransactionBalanceID] PRIMARY KEY CLUSTERED ([AccountTransactionLedgerID] ASC),
    CONSTRAINT [FK_AccountTransactionLedgers_Accounts_fkAccountID]  FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID]),
    FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);

