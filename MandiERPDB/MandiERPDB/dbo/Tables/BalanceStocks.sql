CREATE TABLE [dbo].[BalanceStocks] (
    [BalanceStockID]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [BalanceStockNo]   BIGINT        NULL,
    [BalanceStockCode] VARCHAR (100) NULL,
    [fkAccountID]      BIGINT        NULL,
    [IsCompanyAccount] VARCHAR (50)  NULL,
    [LedgerStock]      BIGINT        NULL,
    [TransactionDate]  DATETIME      NULL,
    [fkBranchID]       INT           NULL,
    [IsActive]         VARCHAR (20)  CONSTRAINT [DF_BalanceStocks_IsActive] DEFAULT ('Active') NULL,
    [InsertDate]       DATETIME      CONSTRAINT [DF_BalanceStocks_InsertDate] DEFAULT (getdate()) NULL,
    [ModifyDate]       DATETIME      NULL,
    [CreatedBy]        INT           NULL,
    [ModifiedBy]       INT           NULL,
    [Sysdate]          DATETIME      CONSTRAINT [DF_BalanceStocks_Sysdate] DEFAULT (getdate()) NULL,
     CONSTRAINT [PK_BalanceStocks_BalanceStockID]  PRIMARY KEY CLUSTERED ([BalanceStockID] ASC)
);

