CREATE TABLE [dbo].[Users] (
    [UserID]     INT           IDENTITY (1, 1) NOT NULL,
    [UserNo]     INT           NULL,
    [UserName]   VARCHAR (250) NOT NULL,
    [IsAdmin]    VARCHAR (20)  NULL,
    [fkBranchID] INT           NULL,
    [IsActive]   VARCHAR (20)  CONSTRAINT [DF_Users_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]   INT           NULL,
    [CreateDate] DATETIME      CONSTRAINT [DF_Users_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]   INT           NULL,
    [ModifyDate] DATETIME      NULL,
    [Sysdate]    DATETIME      CONSTRAINT [DF_Users_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Users_UserID] PRIMARY KEY CLUSTERED ([UserID] ASC),
    CONSTRAINT [UNC_Users_UserName] UNIQUE NONCLUSTERED ([UserName] ASC)
);

