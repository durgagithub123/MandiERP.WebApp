CREATE TABLE [dbo].[GadiMasters] (
    [GadiMasterID] INT            IDENTITY (1, 1) NOT NULL,
    [GadiMasterNo] INT            NULL,
    [GadiNo]       NVARCHAR (500) NULL,
    [Address]      NVARCHAR (250) NULL,
    [City]         NVARCHAR (250) NULL,
    [State]        NVARCHAR (50)  NULL,
    [Country]      NVARCHAR (150) NULL,
    [PinCode]      DECIMAL (18)   NULL,
    [MobileNo]     VARCHAR (50)   NULL,
    [PhoneNo]      NVARCHAR (50)  NULL,
    [EmailID]      NVARCHAR (50)  NULL,
    [FaxNo]        DECIMAL (18)   NULL,
    [fkBranchID]   INT            NULL,
    [IsActive]     VARCHAR (20)    CONSTRAINT [DF_GadiMasters_IsActive]  DEFAULT ('Active') NULL,
    [CreateBy]     INT            NULL,
    [CreateDate]   DATETIME        CONSTRAINT [DF_GadiMasters_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]     INT            NULL,
    [ModifyDate]   DATETIME       NULL,
    [Sysdate]      DATETIME        CONSTRAINT [DF_GadiMasters_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_GadiMasters_GadiMasterID]  PRIMARY KEY CLUSTERED ([GadiMasterID] ASC)
);

