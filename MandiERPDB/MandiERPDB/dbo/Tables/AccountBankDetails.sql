CREATE TABLE [dbo].[AccountBankDetails] (
    [AccountBankDetailID] BIGINT        IDENTITY (1, 1) NOT NULL,
    [AccountBankDetailNo] BIGINT        NULL,
    [fkAccountID]         BIGINT        NULL,
    [BankAccountNo]       VARCHAR (100) NULL,
    [BranchNo]            VARCHAR (50)  NULL,
    [BranchName]          VARCHAR (50)  NULL,
    [IfscCode]            VARCHAR (50)  NULL,
    [PanNo]               VARCHAR (50)  NULL,
    [AccountHolderName]   VARCHAR (50)  NULL,
    [Detail]              VARCHAR (50)  NULL,
    [Comments]            VARCHAR (500) NULL,
    [IsShowonPage]        VARCHAR (10)  NULL,
    [fkBranchID]          INT           NULL,
    [IsActive]            VARCHAR (20)  CONSTRAINT [DF_AccountBankDetails_IsActive] DEFAULT ('Active') NULL,
    [InsertDate]          DATETIME      CONSTRAINT [DF_AccountBankDetails_InsertDate] DEFAULT (getdate()) NULL,
    [ModifyDate]          DATETIME      NULL,
    [CreatedBy]           INT           NULL,
    [ModifiedBy]          INT           NULL,
    [Sysdate]             DATETIME      CONSTRAINT [DF_AccountBankDetails_Sysdate]  DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_AccountBankDetails_AccountBankDetailID] PRIMARY KEY CLUSTERED ([AccountBankDetailID] ASC),
    CONSTRAINT [FK_AccountBankDetails_Accounts_fkAccountID] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);

