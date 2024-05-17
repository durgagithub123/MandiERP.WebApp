CREATE TABLE [dbo].[BalanceDailyStocks] (
    [BalanceDailyStockID]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [BalanceDailyStockNo]   BIGINT        NULL,
    [BalanceDailyStockCode] VARCHAR (100) NULL,
    [fkAccountID]           BIGINT        NULL,
    [IsCompanyAccount]      VARCHAR (50)  NULL,
    [LedgerStock]           BIGINT        NULL,
    [TransactionDate]       DATETIME      NULL,
    [fkBranchID]            INT           NULL,
    [IsActive]              VARCHAR (20)  CONSTRAINT [DF_BalanceDailyStocks_IsActive] DEFAULT ('Active') NULL,
    [InsertDate]            DATETIME      CONSTRAINT [DF_BalanceDailyStocks_InsertDate] DEFAULT (getdate()) NULL,
    [ModifyDate]            DATETIME      NULL,
    [CreatedBy]             INT           NULL,
    [ModifiedBy]            INT           NULL,
    [Sysdate]               DATETIME      CONSTRAINT [DF_BalanceDailyStocks_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_BalanceDailyStocks_BalanceDailyStockID]  PRIMARY KEY CLUSTERED ([BalanceDailyStockID] ASC)
);

