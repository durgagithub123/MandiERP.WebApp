CREATE TABLE [dbo].[UserLogin] (
    [UserLoginID]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserLoginNo]  BIGINT         NULL,
    [fkUserID]     INT            NOT NULL,
    [LoginDate]    DATETIME       NULL,
    [Logout]       DATETIME       NULL,
    [LoginMessage] NVARCHAR (500) NULL,
    [fkBranchID]   INT            NULL,
    [IsActive]     VARCHAR (20)   CONSTRAINT [DF_UserLogin_IsActive] DEFAULT ('Active') NULL,
    [CreateDate]   DATETIME       CONSTRAINT [DF_UserLogin_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyDate]   DATETIME       NULL,
    [Sysdate]      DATETIME       CONSTRAINT [DF_UserLogin_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_UserLogin_UserLoginID] PRIMARY KEY CLUSTERED ([UserLoginID] ASC),
    CONSTRAINT [FK_UserLogin_Users_fkUserID] FOREIGN KEY ([fkUserID]) REFERENCES [dbo].[Users] ([UserID])
);

