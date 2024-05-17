CREATE TABLE [dbo].[Roles] (
    [RoleID]     INT          IDENTITY (1, 1) NOT NULL,
    [RoleNo]     INT          NULL,
    [RoleName]   VARCHAR (50) NULL,
    [fkBranchID] INT          NULL,
    [IsActive]   VARCHAR (20) CONSTRAINT [DF_Roles_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]   INT          NULL,
    [CreateDate] DATETIME     CONSTRAINT [DF_Roles_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]   INT          NULL,
    [ModifyDate] DATETIME     NULL,
    [Sysdate]    DATETIME     CONSTRAINT [DF_Roles_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Roles_RoleID] PRIMARY KEY CLUSTERED ([RoleID] ASC),
    CONSTRAINT [UNC_Roles_RoleName] UNIQUE NONCLUSTERED ([RoleName] ASC)
);

