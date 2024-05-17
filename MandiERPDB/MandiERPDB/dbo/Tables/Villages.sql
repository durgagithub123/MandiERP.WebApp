CREATE TABLE [dbo].[Villages] (
    [VillageID]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [VillageNo]        BIGINT          NULL,
    [VillageName]      NVARCHAR (250)  NOT NULL,
    [VillageNameHindi] NVARCHAR (250)  NULL,
    [State]            NVARCHAR (250)  NULL,
    [Zip]              NVARCHAR (250)  NULL,
    [Address]          NVARCHAR (1000) NULL,
    [fkBranchID]       INT             NULL,
    [IsActive]         VARCHAR (20)    CONSTRAINT [DF_Villages_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]         INT             NULL,
    [CreateDate]       DATETIME        CONSTRAINT [DF_Villages_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]         INT             NULL,
    [ModifyDate]       DATETIME        NULL,
    [Sysdate]          DATETIME        CONSTRAINT [DF_Villages_Sysdate] DEFAULT (getdate()) NULL,
     CONSTRAINT [PK_Villages_VillageID] PRIMARY KEY CLUSTERED ([VillageID] ASC)
);

