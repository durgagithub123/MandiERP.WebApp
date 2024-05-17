CREATE TABLE [dbo].[BalanceHammalis] (
    [BalanceHammaliID]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [BalanceHammaliNo]   BIGINT          NULL,
    [BalanceHammaliCode] VARCHAR (100)   NULL,
    [fkAccountID]        BIGINT          NULL,
    [IsCompanyAccount]   VARCHAR (50)    NULL,
    [LedgerHammali]      DECIMAL (18, 2) NULL,
    [fkBranchID]         INT             NULL,
    [IsActive]           VARCHAR (20)    CONSTRAINT [DF_BalanceHammalis_IsActive] DEFAULT ('Active') NULL,
    [InsertDate]         DATETIME        CONSTRAINT [DF_BalanceHammalis_InsertDate] DEFAULT (getdate()) NULL,
    [ModifyDate]         DATETIME        NULL,
    [CreatedBy]          INT             NULL,
    [ModifiedBy]         INT             NULL,
    [Sysdate]            DATETIME        CONSTRAINT [DF_BalanceHammalis_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_BalanceHammalis_BalanceHammaliID] PRIMARY KEY CLUSTERED ([BalanceHammaliID] ASC),
    CONSTRAINT [FK_BalanceHammalis_Accounts_fkAccountID] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);

