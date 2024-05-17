CREATE TABLE [dbo].[UserLoginMaster] (
    [UserLoginMasterID]       INT             IDENTITY (1, 1) NOT NULL,
    [UserID]       INT            NOT NULL,
    [RoleID]       INT            NOT NULL,
    [FirstName]    NVARCHAR (250) NOT NULL,
    [Middleame]    NVARCHAR (250) NULL,
    [LastName]     NVARCHAR (250) NULL,
    [UserName]     VARCHAR (250)  NOT NULL,
    [IsAdmin]      VARCHAR (20)   NULL,
    [Password]     VARCHAR (250)  NOT NULL,
    [RoleName]     VARCHAR (50)   NULL,
    [LoginDate]    DATETIME       NULL,
    [Logout]       DATETIME       NULL,
    [LoginMessage] NVARCHAR (500) NULL,
     CONSTRAINT [PK_UserLoginMaster_UserLoginMasterID] PRIMARY KEY CLUSTERED ([UserLoginMasterID] ASC)

);

