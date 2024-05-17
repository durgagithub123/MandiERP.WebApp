CREATE TABLE [dbo].[ExpMaster] (
    [ExpSNo]    INT          NOT NULL,
    [ExpName]   VARCHAR (50) NULL,
    [ExpAcd]    INT          NULL,
    [ExpHindi]  VARCHAR (50) NULL,
    [PIsActive] VARCHAR (3)  NULL,
    [POrderNo]  INT          NULL,
    [PExpType]  VARCHAR (10) NULL,
    [PExpRate]  FLOAT (53)   NULL,
    [SIsActive] VARCHAR (3)  NULL,
    [SOrderNo]  INT          NULL,
    [SExpType]  VARCHAR (10) NULL,
    [SExpRate]  FLOAT (53)   NULL,
    [FIsActive] VARCHAR (3)  NULL,
    [FOrderNo]  INT          NULL,
    [FExpType]  VARCHAR (10) NULL,
    [FRate1]    FLOAT (53)   NULL,
    [FRate2]    FLOAT (53)   NULL,
    [Sysdate]   DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ExpSNo] ASC)
);

