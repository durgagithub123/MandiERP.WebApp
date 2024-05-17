CREATE TABLE [dbo].[UserCMS] (
    [UserCMSID]  INT             IDENTITY (1, 1) NOT NULL,
    [UserCMSNo]  INT             NULL,
    [Attribute]  NVARCHAR (250)  NULL,
    [Value]      NVARCHAR (1000) NULL,
    [fkBranchID] INT             NULL,
    [IsActive]   VARCHAR (20)    CONSTRAINT [DF_UserCMS_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]   INT             NULL,
    [CreateDate] DATETIME        CONSTRAINT [DF_UserCMS_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]   INT             NULL,
    [ModifyDate] DATETIME        NULL,
    [Sysdate]    DATETIME        CONSTRAINT [DF_UserCMS_Sysdate] DEFAULT (getdate()) NULL,
     CONSTRAINT [PK_UserCMS_UserCMSID] PRIMARY KEY CLUSTERED ([UserCMSID] ASC)
);

