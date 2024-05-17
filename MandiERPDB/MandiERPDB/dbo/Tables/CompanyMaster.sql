CREATE TABLE [dbo].[CompanyMaster] (
    [cCode]          INT           NOT NULL,
    [CName]          VARCHAR (50)  NOT NULL,
    [cContactPerson] VARCHAR (50)  NULL,
    [cAddress1]      VARCHAR (150) NULL,
    [cAddress2]      VARCHAR (150) NULL,
    [cPhone]         VARCHAR (50)  NULL,
    [cMobile]        VARCHAR (50)  NULL,
    [cEmail]         VARCHAR (50)  NULL,
    [cPan]           VARCHAR (50)  NULL,
    [IsActive]       BIT           NULL,
    [cDB]            VARCHAR (50)  NULL,
    [cFYSdt]         DATETIME      NULL,
    [cFYEdt]         DATETIME      NULL,
    [ShortName]      VARCHAR (5)   NULL,
    [PurExpInd]      VARCHAR (3)   NULL,
    [CommInTO]       VARCHAR (3)   NULL,
    [LoadingTO]      VARCHAR (3)   NULL,
    [FBInd]          VARCHAR (3)   NULL,
    [Sysdate]        DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([cCode] ASC)
);

