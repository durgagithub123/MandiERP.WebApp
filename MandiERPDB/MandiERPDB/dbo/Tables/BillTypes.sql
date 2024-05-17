CREATE TABLE [dbo].[BillTypes] (
    [BillTypeID]           INT            IDENTITY (1, 1) NOT NULL,
    [BillTypeNo]           INT            NULL,
    [BillType]             NVARCHAR (500) NOT NULL,
    [IsChangesAllowonBill] VARCHAR (20)   CONSTRAINT [DF_BillTypes_IsChangesAllowonBill] DEFAULT ((1)) NULL,
    [IsShowonPage]         VARCHAR (10)   NULL,
    [fkBranchID]           INT            NULL,
    [IsActive]             VARCHAR (20)   CONSTRAINT [DF_BillTypes_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]             INT            NULL,
    [CreateDate]           DATETIME       CONSTRAINT [DF_BillTypes_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]             INT            NULL,
    [ModifyDate]           DATETIME       NULL,
    [Sysdate]              DATETIME       CONSTRAINT [DF_BillTypes_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_BillTypes_BillTypeID]  PRIMARY KEY CLUSTERED ([BillTypeID] ASC)
);

