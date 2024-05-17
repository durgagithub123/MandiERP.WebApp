﻿CREATE TABLE [dbo].[ManageHammalis] (
    [ManageHammaliID]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [ManageHammaliNo]     BIGINT          NULL,
    [ManageHammaliCode]   VARCHAR (100)   NULL,
    [ManageHammaliDetail] VARCHAR (100)   NULL,
    [fkAccountID]         BIGINT          NULL,
    [IsCompanyAccount]    VARCHAR (50)    NULL,
    [fkBillID]            INT             NULL,
    [fkExportID]          INT             NULL,
    [TransactionDate]     DATETIME        NULL,
    [TransactionDetail]   VARCHAR (250)   NULL,
    [DebitHammali]        DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [CreditHammali]       DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [IsDebitOrCredit]     NVARCHAR (50)   NULL,
    [BalanceHammali]      DECIMAL (18, 2) NULL,
    [RecieptType]         VARCHAR (20)    NULL,
    [Remark]              VARCHAR (200)   NULL,
    [Comment]             VARCHAR (200)   NULL,
    [fkBranchID]          INT             NULL,
    [IsActive]            VARCHAR (20)    CONSTRAINT [DF_ManageHammalis_IsActive] DEFAULT ('Active') NULL,
    [InsertDate]          DATETIME        CONSTRAINT [DF_ManageHammalis_InsertDate] DEFAULT (getdate()) NULL,
    [ModifyDate]          DATETIME        NULL,
    [CreatedBy]           INT             NULL,
    [ModifiedBy]          INT             NULL,
    [Sysdate]             DATETIME        CONSTRAINT [DF_ManageHammalis_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ManageHammalis_ManageHammaliID]  PRIMARY KEY CLUSTERED ([ManageHammaliID] ASC),
    CONSTRAINT [FK_ManageHammalis_Accounts_fkAccountID] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);
