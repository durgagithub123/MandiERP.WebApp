CREATE TABLE [dbo].[UserDetails] (
    [UserDetailID] INT             IDENTITY (1, 1) NOT NULL,
    [UserDetailNo] INT             NULL,
    [fkUserID]     INT             NOT NULL,
    [FirstName]    NVARCHAR (250)  NOT NULL,
    [Middleame]    NVARCHAR (250)  NULL,
    [LastName]     NVARCHAR (250)  NULL,
    [PhoneNo]      NVARCHAR (50)   NULL,
    [MobileNo]     NVARCHAR (50)   NULL,
    [City]         NVARCHAR (250)  NULL,
    [State]        NVARCHAR (250)  NULL,
    [Zip]          NVARCHAR (250)  NULL,
    [Address]      NVARCHAR (1000) NULL,
    [fkBranchID]   INT             NULL,
    [IsActive]     VARCHAR (20)    CONSTRAINT [DF_UserDetails_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]     INT             NULL,
    [CreateDate]   DATETIME        CONSTRAINT [DF_UserDetails_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]     INT             NULL,
    [ModifyDate]   DATETIME        NULL,
    [Sysdate]      DATETIME        CONSTRAINT [DF_UserDetails_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_UserDetails_UserDetailID] PRIMARY KEY CLUSTERED ([UserDetailID] ASC),
    CONSTRAINT [FK_UserDetails_Users_fkUserID] FOREIGN KEY ([fkUserID]) REFERENCES [dbo].[Users] ([UserID])
);

