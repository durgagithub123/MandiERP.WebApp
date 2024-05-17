CREATE TABLE [dbo].[ItemTypes] (
    [ItemTypeID]       INT             IDENTITY (1, 1) NOT NULL,
    [ItemTypeNo]       INT             NULL,
    [ItemName]         NVARCHAR (500)  NULL,
    [ItemNameHindi]    NVARCHAR (500)  NULL,
    [RateOfUnitinKGS]  INT             NULL,
    [PercentComission] DECIMAL (10, 2) NULL,
    [fkBranchID]       INT             NULL,
    [IsActive]         VARCHAR (20)    CONSTRAINT [DF_ItemTypes_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]         INT             NULL,
    [CreateDate]       DATETIME        CONSTRAINT [DF_ItemTypes_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]         INT             NULL,
    [ModifyDate]       DATETIME        NULL,
    [Sysdate]          DATETIME        CONSTRAINT [DF_ItemTypes_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ItemTypes_ItemTypeID]  PRIMARY KEY CLUSTERED ([ItemTypeID] ASC)
);

