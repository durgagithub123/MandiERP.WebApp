﻿CREATE TABLE [dbo].[ItemSaleRateDiffs] (
    [ItemSaleRateDiffID]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [ItemSaleRateDiffNo]        BIGINT          NULL,
    [ItemSaleRateDiffCode]      VARCHAR (100)   NULL,
    [ItemSaleRateDiffDetail]    VARCHAR (100)   NULL,
    [fkAccountID]               BIGINT          NULL,
    [fkItemSaleDetailID]        BIGINT          NULL,
    [IsCompanyAccount]          VARCHAR (50)    NULL,
    [fkBillDetailID]            BIGINT          NOT NULL,
    [Quantity]                  DECIMAL (10)    NULL,
    [Rate]                      DECIMAL (18, 2) NULL,
    [SaleTypeFixOrWeightBased]  NVARCHAR (50)   NULL,
    [GrossWeight]               DECIMAL (18, 2) NULL,
    [WeightDetails]             VARCHAR (4000)  NULL,
    [NetWeight]                 DECIMAL (18, 2) NULL,
    [CommissionPercent]         DECIMAL (18, 2) NULL,
    [CommissionAmount]          DECIMAL (18, 2) NULL,
    [TotalAmount]               DECIMAL (18, 2) NULL,
    [NetAmount]                 DECIMAL (18, 2) NULL,
    [SQuantity]                 DECIMAL (10)    NULL,
    [SRate]                     DECIMAL (18, 2) NULL,
    [SSaleTypeFixOrWeightBased] NVARCHAR (50)   NULL,
    [SGrossWeight]              DECIMAL (18, 2) NULL,
    [SWeightDetails]            VARCHAR (4000)  NULL,
    [SNetWeight]                DECIMAL (18, 2) NULL,
    [SCommissionPercent]        DECIMAL (18, 2) NULL,
    [SCommissionAmount]         DECIMAL (18, 2) NULL,
    [STotalAmount]              DECIMAL (18, 2) NULL,
    [SNetAmount]                DECIMAL (18, 2) NULL,
    [fkBranchID]                INT             NULL,
    [IsActive]                  VARCHAR (20)    NULL,
    [CreateBy]                  INT             NULL,
    [CreateDate]                DATETIME        NULL,
    [ModifyBy]                  INT             NULL,
    [ModifyDate]                DATETIME        NULL,
    [fkBillID]                  BIGINT          NULL,
    [Sysdate]                   DATETIME        CONSTRAINT [DF_ItemSaleRateDiffs_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ItemSaleRateDiffs_ItemSaleRateDiffID]  PRIMARY KEY CLUSTERED ([ItemSaleRateDiffID] ASC),
    CONSTRAINT [FK_ItemSaleRateDiffs_Accounts_fkAccountID] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID]),
    CONSTRAINT [FK_ItemSaleRateDiffs_ItemSaleDetails_fkItemSaleDetailID] FOREIGN KEY ([fkItemSaleDetailID]) REFERENCES [dbo].[ItemSaleDetails] ([ItemSaleDetailID]),
);

