CREATE TABLE [dbo].[UserInRoles] (
    [UserInRoleID] INT          IDENTITY (1, 1) NOT NULL,
    [UserInRoleNo] INT          NULL,
    [fkUserID]     INT          NOT NULL,
    [fkRoleID]     INT          NOT NULL,
    [fkBranchID]   INT          NULL,
    [IsActive]     VARCHAR (20) CONSTRAINT [DF_UserInRoles_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]     INT          NULL,
    [CreateDate]   DATETIME     CONSTRAINT [DF_UserInRoles_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]     INT          NULL,
    [ModifyDate]   DATETIME     NULL,
    [Sysdate]      DATETIME     CONSTRAINT [DF_UserInRoles_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_UserInRoles_UserInRoleID] PRIMARY KEY CLUSTERED ([UserInRoleID] ASC)
);

