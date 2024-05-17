CREATE TABLE [dbo].[AccountTypes] (
    [AccountTypeID]     INT           IDENTITY (1, 1) NOT NULL,
    [AccountTypeNo]     INT           NULL,
    [AccountCode]       VARCHAR (50)  NULL,
    [AccountTypeName]   VARCHAR (50)  NULL,
    [AccountType]       VARCHAR (20)  NULL,
    [AccountTypeDetail] VARCHAR (50)  NULL,
    [Comment]           VARCHAR (500) NULL,
    [SubHeadDetail]     VARCHAR (50)  NULL,
    [IsBalanceKhata]    VARCHAR (50)  NULL,
    [IsShowonPage]      VARCHAR (10)  NULL,
    [fkBranchID]        INT           NULL,
    [IsActive]          VARCHAR (20)  CONSTRAINT [DF_AccountTypes_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]          INT           NULL,
    [CreateDate]        DATETIME      CONSTRAINT [DF_AccountTypes_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]          INT           NULL,
    [ModifyDate]        DATETIME      NULL,
    [Sysdate]           DATETIME      CONSTRAINT [DF_AccountTypes_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_AccountTypes_AccountTypeID] PRIMARY KEY CLUSTERED ([AccountTypeID] ASC)
);

