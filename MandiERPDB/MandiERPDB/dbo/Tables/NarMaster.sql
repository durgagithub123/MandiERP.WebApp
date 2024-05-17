CREATE TABLE [dbo].[NarMaster] (
    [NarCode]  INT          NULL,
    [NarName]  VARCHAR (50) NULL,
    [IsActive] BIT          NULL,
    [ent_date] DATETIME     NULL,
    [Sysdate]  DATETIME     DEFAULT (getdate()) NULL
);

