CREATE TABLE [dbo].[BalanceCarats] (
    [BalanceCaratID]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [BalanceCaratNo]   BIGINT       NULL,
    [fkAccountID]      BIGINT       NULL,
    [IsCompanyAccount] VARCHAR (50) NULL,
    [LedgerCarat]      INT          NULL,
    [TransactionDate]  DATETIME     NULL,
    [fkBranchID]       INT          NULL,
    [IsActive]         VARCHAR (20) CONSTRAINT [DF_BalanceCarats_IsActive] DEFAULT ('Active') NULL,
    [InsertDate]       DATETIME     CONSTRAINT [DF__BalanceCarats_InsertDate] DEFAULT (getdate()) NULL,
    [ModifyDate]       DATETIME     NULL,
    [CreatedBy]        INT          NULL,
    [ModifiedBy]       INT          NULL,
    [Sysdate]          DATETIME     CONSTRAINT [DF__BalanceCarats_Sysdate]  DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_BalanceCarats_BalanceCaratID] PRIMARY KEY CLUSTERED ([BalanceCaratID] ASC),
    CONSTRAINT [FK_BalanceCarats_Accounts_fkAccountID] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);

