CREATE TABLE [dbo].[ItemWeightDetails] (
    [ItemWeightDetailID] INT             IDENTITY (1, 1) NOT NULL,
    [ItemWeightDetailNo] INT             NULL,
    [fkBillDetailID]     BIGINT          NOT NULL,
    [WeightinKGM]        DECIMAL (18, 2) CONSTRAINT [DF_ItemWeightDetails_WeightinKGM] DEFAULT ((0)) NULL,
    [fkBranchID]         INT             NULL,
    [IsActive]           VARCHAR (20)    CONSTRAINT [DF_ItemWeightDetails_IsActivee] DEFAULT ('Active') NULL,
    [CreateBy]           INT             NULL,
    [CreateDate]         DATETIME        CONSTRAINT [DF_ItemWeightDetails_CreateBy] DEFAULT (getdate()) NULL,
    [ModifyBy]           INT             NULL,
    [ModifyDate]         DATETIME        NULL,
    [Sysdate]            DATETIME        CONSTRAINT [DF_ItemWeightDetails_Sysdate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ItemWeightDetails_ItemWeightDetailID]  PRIMARY KEY CLUSTERED ([ItemWeightDetailID] ASC),
    CONSTRAINT [FK_ItemWeightDetails_BillDetails_fkBillDetailID] FOREIGN KEY ([fkBillDetailID]) REFERENCES [dbo].[BillDetails] ([BillDetailID]),
);

