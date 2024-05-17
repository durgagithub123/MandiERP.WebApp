CREATE TABLE [dbo].[UserConfigs] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [HardwareID]         VARCHAR (500)  NULL,
    [EncHardwareID]      VARCHAR (1000) NULL,
    [MacAddress]         VARCHAR (500)  NULL,
    [EncMacAddress]      VARCHAR (1000) NULL,
    [IPAddress]          VARCHAR (500)  NULL,
    [EncIPAddress]       VARCHAR (1000) NULL,
    [WindowsUserName]    VARCHAR (500)  NULL,
    [EncWindowsUserName] VARCHAR (500)  NULL,
    [Sysdate]            DATETIME       CONSTRAINT [DF_UserConfigs_Sysdate] DEFAULT (getdate()) NULL
);

