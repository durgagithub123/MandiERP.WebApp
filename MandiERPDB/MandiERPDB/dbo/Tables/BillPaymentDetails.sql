﻿CREATE TABLE [dbo].[BillPaymentDetails] (
    [BillPaymentDeatilID]   INT             IDENTITY (1, 1) NOT NULL,
    [fkBillID]              INT             NULL,
    [CompanyBankAccountID]  INT             NULL,
    [PaymentMode]           VARCHAR (250)   NULL,
    [CashAmount]            DECIMAL (10, 2) NULL,
    [fkAccountBankDetailID] INT             NULL,
    [ChequeDate]            DATETIME        NULL,
    [ChequeNo]              VARCHAR (250)   NULL,
    [ChequeAmount]          DECIMAL (10, 2) NULL,
    [BankAccountNo]         VARCHAR (100)   NULL,
    [BranchNo]              VARCHAR (50)    NULL,
    [BranchName]            VARCHAR (50)    NULL,
    [IfscCode]              VARCHAR (50)    NULL,
    [PanNo]                 VARCHAR (50)    NULL,
    [AccountHolderName]     VARCHAR (50)    NULL,
    [fkBranchID]            INT             NULL,
    [IsActive]              VARCHAR (20)    NULL,
    [InsertDate]            DATETIME        NULL,
    [ModifyDate]            DATETIME        NULL,
    [CreatedBy]             INT             NULL,
    [ModifiedBy]            INT             NULL,
    [TransactionNo]         VARCHAR (250)   NULL,
    [Remark]                VARCHAR (250)   NULL,
    [Sysdate]               DATETIME        CONSTRAINT [DF_BillPaymentDetails_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_BillPaymentDetails_BillPaymentDeatilID] PRIMARY KEY CLUSTERED ([BillPaymentDeatilID] ASC)
);

