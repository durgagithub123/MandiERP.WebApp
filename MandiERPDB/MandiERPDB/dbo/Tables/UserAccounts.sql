CREATE TABLE [dbo].[UserAccounts] (
    [UserAccountID] INT           IDENTITY (1, 1) NOT NULL,
    [UserAccountNo] INT           NULL,
    [fkUserID]      INT           NULL,
    [Password]      VARCHAR (250) NOT NULL,
    [fkBranchID]    INT           NULL,
    [IsActive]      VARCHAR (20)  CONSTRAINT  [DF_UserAccounts_IsActive] DEFAULT('Active') NULL,
    [CreateBy]      INT           NULL,
    [CreateDate]    DATETIME      CONSTRAINT [DF_UserAccounts_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]      INT           NULL,
    [ModifyDate]    DATETIME      NULL,
    [Sysdate]       DATETIME      CONSTRAINT [DF_UserAccounts_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_UserAccounts_UserAccountID] PRIMARY KEY CLUSTERED ([UserAccountID] ASC),
    CONSTRAINT [FK_UserAccounts_Users_fkUserID] FOREIGN KEY ([fkUserID]) REFERENCES [dbo].[Users] ([UserID])
);

