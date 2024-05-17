﻿CREATE TABLE [dbo].[BillMasters] (
    [BillMasterID]     INT             IDENTITY (1, 1) NOT NULL,
    [fkBillID]         BIGINT          NOT NULL,
    [fkAccountID]      BIGINT          NOT NULL,
    [IsCompanyAccount] VARCHAR (50)    NULL,
    [BillPaidStatus]   VARCHAR (50)    NULL,
    [IsCapital]        VARCHAR (10)    NULL,
    [BTQuantity]       DECIMAL (10)    NULL,
    [BTGrossWeight]    DECIMAL (18, 2) NULL,
    [BTCarat]          VARCHAR (4000)  NULL,
    [BTNetWeight]      DECIMAL (18, 2) NULL,
    [BTAmount]         DECIMAL (18, 2) NULL,
    [BTDeduction]      DECIMAL (18, 2) NULL,
    [BTNetAmount]      DECIMAL (18, 2) NULL,
    [CTQuantity]       DECIMAL (10)    NULL,
    [CTGrossWeight]    DECIMAL (18, 2) NULL,
    [CTCarat]          VARCHAR (4000)  NULL,
    [CTNetWeight]      DECIMAL (18, 2) NULL,
    [CTAmount]         DECIMAL (18, 2) NULL,
    [CTDeduction]      DECIMAL (18, 2) NULL,
    [CTNetAmount]      DECIMAL (18, 2) NULL,
    [IsShowonPage]     VARCHAR (10)    NULL,
    [fkBranchID]       INT             NULL,
    [IsActive]         VARCHAR (20)    DEFAULT ('Active') NULL,
    [CreateBy]         INT             NULL,
    [CreateDate]       DATETIME        DEFAULT (getdate()) NULL,
    [ModifyBy]         INT             NULL,
    [ModifyDate]       DATETIME        NULL,
    [Sysdate]          DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([BillMasterID] ASC),
    FOREIGN KEY ([fkBillID]) REFERENCES [dbo].[Bills] ([BillID]),
    FOREIGN KEY ([fkBillID]) REFERENCES [dbo].[Bills] ([BillID]),
    CONSTRAINT [FK__BillMaste__fkAcc__282DF8C2] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);
