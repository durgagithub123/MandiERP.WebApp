CREATE TABLE [dbo].[Admins] (
    [AdminID]    INT           IDENTITY (1, 1) NOT NULL,
    [UserName]   VARCHAR (250) NOT NULL,
    [Password]   VARCHAR (250) NOT NULL,
    [IsAdmin]    VARCHAR (20)  NULL,
    [IsActive]   VARCHAR (20)  NULL,
    [CreateBy]   INT           NULL,
    [CreateDate] DATETIME      NULL,
    [ModifyBy]   INT           NULL,
    [ModifyDate] DATETIME      NULL,
    [Sysdate]    DATETIME      CONSTRAINT [DF_Admins_Sysdate]  DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Admins_AdminID]  PRIMARY KEY CLUSTERED ([AdminID] ASC)
);

