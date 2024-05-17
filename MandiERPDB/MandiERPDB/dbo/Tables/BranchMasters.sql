CREATE TABLE [dbo].[BranchMasters] (
    [BranchID]     INT          IDENTITY (1, 1) NOT NULL,
    [BranchNo]     INT          NULL,
    [BranchName]   VARCHAR (50) NULL,
    [BranchDetail] VARCHAR (50) NULL,
    [IsActive]     VARCHAR (20) CONSTRAINT [DF_BranchMasters_IsActive] DEFAULT ('Active') NULL,
    [CreateBy]     INT          NULL,
    [CreateDate]   DATETIME     CONSTRAINT [DF_BranchMasters_CreateDate] DEFAULT (getdate()) NULL,
    [ModifyBy]     INT          NULL,
    [ModifyDate]   DATETIME     NULL,
    [Sysdate]      DATETIME     CONSTRAINT [DF_BranchMasters_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_BranchMasters_BranchID]  PRIMARY KEY CLUSTERED ([BranchID] ASC)
);

