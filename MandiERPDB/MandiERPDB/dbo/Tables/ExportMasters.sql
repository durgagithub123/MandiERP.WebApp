﻿CREATE TABLE [dbo].[ExportMasters] (
    [ExportMasterID]         INT             IDENTITY (1, 1) NOT NULL,
    [ExportMasterNo]         INT             NULL,
    [ExportCode]             VARCHAR (100)   NULL,
    [ExportCodeDetail]       VARCHAR (100)   NULL,
    [fkAccountID]            BIGINT          NULL,
    [BiltiNo]                INT             NULL,
    [IsExportBaki]           VARCHAR (50)    NULL,
    [IsExportBakiDetail]     VARCHAR (250)   NULL,
    [ExportMasterPaidStatus] VARCHAR (50)    NULL,
    [BiltiDetail]            VARCHAR (100)   NULL,
    [BiltiDate]              DATETIME        NULL,
    [ClientName]             NVARCHAR (500)  NULL,
    [fkVillageID]            BIGINT          NULL,
    [ClientCity]             NVARCHAR (500)  NULL,
    [DriverName]             NVARCHAR (500)  NULL,
    [DriverPhoneNo]          NVARCHAR (500)  NULL,
    [DriverInam]             NVARCHAR (250)  NULL,
    [GadiBhada]              DECIMAL (18, 2) NULL,
    [AdvanceBhada]           DECIMAL (18, 2) NULL,
    [RemainingBhada]         DECIMAL (18, 2) NULL,
    [ReachDate]              DATETIME        NULL,
    [TimeToReach]            NVARCHAR (250)  NULL,
    [PerKattaBhada]          DECIMAL (18, 2) NULL,
    [PerCaratBhada]          DECIMAL (18, 2) NULL,
    [ParBoriBhada]           DECIMAL (18, 2) NULL,
    [FakeMandiAmount]        DECIMAL (18, 2) NULL,
    [FakeMandiPercent]       DECIMAL (18, 2) NULL,
    [FakeMandiNetAmount]     DECIMAL (18, 2) NULL,
    [TotalExportAmount]      DECIMAL (18, 2) NULL,
    [TotalBillExportAmount]  DECIMAL (18, 2) NULL,
    [TotalExpenses]          DECIMAL (18, 2) NULL,
    [BillTotalExpenses]      DECIMAL (18, 2) NULL,
    [NetExportAmount]        DECIMAL (18, 2) NULL,
    [BillNetExportAmount]    DECIMAL (18, 2) NULL,
    [GadiNo]                 VARCHAR (50)    NULL,
    [TotalHammali]           DECIMAL (18, 2) NULL,
    [MandiSulk]              DECIMAL (18, 2) NULL,
    [fkBranchID]             INT             NULL,
    [IsActive]               VARCHAR (20)    CONSTRAINT [DF_ExportMasters_IsActive] DEFAULT ('Active') NULL,
    [InsertDate]             DATETIME        CONSTRAINT [DF_ExportMasters_InsertDate] DEFAULT (getdate()) NULL,
    [ModifyDate]             DATETIME        NULL,
    [CreatedBy]              INT             NULL,
    [ModifiedBy]             INT             NULL,
    [Address]                VARCHAR (1000)  NULL,
    [Transport]              VARCHAR (500)   NULL,
    [Sysdate]                DATETIME        CONSTRAINT [DF_ExportMasters_Sysdate] DEFAULT (getdate()) NULL,
	PaidAmount				   Decimal(10,2),
	Discount				   Decimal(10,2),
	RemainingAmount			   Decimal(10,2),
	IsPaid				   bit,
    CONSTRAINT [PK_ExportMasters_ExportMasterID] PRIMARY KEY CLUSTERED ([ExportMasterID] ASC)
);

