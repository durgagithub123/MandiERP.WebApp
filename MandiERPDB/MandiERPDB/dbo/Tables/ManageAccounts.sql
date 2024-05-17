CREATE TABLE [dbo].[ManageAccounts] (
    [ManageAccountID] BIGINT       IDENTITY (1, 1) NOT NULL,
    [ManageAccountNo] BIGINT       NULL,
    [fkAccountID]     BIGINT       NULL,
    [fkAccountTypeID] INT          NULL,
    [IsShowonPage]    VARCHAR (10) NULL,
    [fkBranchID]      INT          NULL,
    [IsActive]        VARCHAR (20) DEFAULT ('Active') NULL,
    [InsertDate]      DATETIME     DEFAULT (getdate()) NULL,
    [ModifyDate]      DATETIME     NULL,
    [CreatedBy]       INT          NULL,
    [ModifiedBy]      INT          NULL,
    [Sysdate]         DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ManageAccountID] ASC),
    FOREIGN KEY ([fkAccountTypeID]) REFERENCES [dbo].[AccountTypes] ([AccountTypeID]),
    FOREIGN KEY ([fkAccountTypeID]) REFERENCES [dbo].[AccountTypes] ([AccountTypeID]),
    CONSTRAINT [FK__ManageAcc__fkAcc__1CBC4616] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);

