﻿CREATE TABLE [dbo].[BillPayments] (
    [BillPaymentID]         BIGINT          IDENTITY (1, 1) NOT NULL,
    [BillPaymentNo]         BIGINT          NULL,
    [BillPaymentCode]       VARCHAR (100)   NULL,
    [fkBillID]              BIGINT          NULL,
    [SNo]                   INT             NULL,
    [PaidAmount]            DECIMAL (18, 2) NULL,
    [PaidDate]              DATETIME        NULL,
    [fkBranchID]            INT             NULL,
    [IsActive]              VARCHAR (20)    CONSTRAINT [DF_BillPayments_IsActive] DEFAULT ((1)) NULL,
    [CreateBy]              INT             NULL,
    [CreateDate]            DATETIME         CONSTRAINT [DF_BillPayments_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]              INT             NULL,
    [ModifyDate]            DATETIME        NULL,
    [Sysdate]               DATETIME        CONSTRAINT [DF_BillPayments_Sysdate] DEFAULT (getdate()) NULL,
    [fkBankAccountID]       INT             NULL,
    [fkAccountBankDetailID] INT             NULL,
    [Remark]                VARCHAR (500)   NULL,
	[fkItemSaleDetailID] [int] NULL,
	[fkCashBookID] [int] NULL,
	[fkBillDetailID] [int] NULL,
	[fkExportMasterID] [int] NULL,
    CONSTRAINT [PK_BillPayments_BillPaymentID] PRIMARY KEY CLUSTERED ([BillPaymentID] ASC)
);
