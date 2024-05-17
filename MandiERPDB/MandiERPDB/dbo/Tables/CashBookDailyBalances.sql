﻿CREATE TABLE [dbo].[CashBookDailyBalances] (
    [CashBookDailyBalanceID]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [CashBookDailyBalanceNo]   BIGINT          NULL,
    [CashBookDailyBalanceCode] VARCHAR (100)   NULL,
    [IsCompanyAccount]         VARCHAR (50)    NULL,
    [fkAccountID]              BIGINT          NULL,
    [fkAccountType]            INT             NULL,
    [BalanceAmount]            DECIMAL (18, 2) NOT NULL,
    [TransactionDate]          DATETIME        NULL,
    [fkBranchID]               INT             NULL,
    [IsActive]                 VARCHAR (20)    DEFAULT ('Active') NULL,
    [InsertDate]               DATETIME        DEFAULT (getdate()) NULL,
    [ModifyDate]               DATETIME        NULL,
    [CreatedBy]                INT             NULL,
    [ModifiedBy]               INT             NULL,
    [Sysdate]                  DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([CashBookDailyBalanceID] ASC)
);

