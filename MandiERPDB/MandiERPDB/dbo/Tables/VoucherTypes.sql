CREATE TABLE [dbo].[VoucherTypes] (
    [VoucherTypeID]    INT            IDENTITY (1, 1) NOT NULL,
    [VoucherName]      VARCHAR (250)  NULL,
    [VoucherNameHindi] NVARCHAR (250) NULL,
    [IsAccount]        VARCHAR (20)   NULL,
    [Detail]           VARCHAR (50)   NULL,
    [Comment]          VARCHAR (50)   NULL,
    [IsActive]         VARCHAR (20)   NULL,
    [InsertDate]       DATETIME       NULL,
    [ModifyDate]       DATETIME       NULL,
    [CreatedBy]        INT            NULL,
    [ModifiedBy]       INT            NULL,
    [Sysdate]          DATETIME       CONSTRAINT [DF_VoucherTypes_Sysdate] DEFAULT (getdate()) NULL,
     CONSTRAINT [PK_VoucherTypes_VoucherTypeID] PRIMARY KEY CLUSTERED ([VoucherTypeID] ASC)
);

