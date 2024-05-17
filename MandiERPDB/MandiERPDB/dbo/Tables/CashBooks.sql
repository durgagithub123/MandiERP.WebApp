CREATE TABLE [dbo].[CashBooks] (
    [CashBookID]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [CashBookNo]        BIGINT          NULL,
    [CashBookCode]      VARCHAR (50)    NULL,
    [CashBookDetail]    VARCHAR (50)    NULL,
    [VoucherNo]         BIGINT          NULL,
    [VoucherType]       VARCHAR (50)    NULL,
    [CashorBankAccount] VARCHAR (50)    NULL,
    [ChequeNo]          VARCHAR (50)    NULL,
    [RecieptType]       VARCHAR (20)    NULL,
    [fkAccountID]       BIGINT          NULL,
    [fkAccountType]     INT             NULL,
    [fkVillageID]       INT             NULL,
    [VillageName]       VARCHAR (50)    NULL,
    [IsCompanyAccount]  VARCHAR (50)    NULL,
    [AccountHolder]     NVARCHAR (500)  NULL,
    [TransactionDate]   DATETIME        NULL,
    [TransactionDetail] NVARCHAR (500)  NULL,
    [Folio]             NVARCHAR (500)  NULL,
    [DebitAmount]       DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [CreditAmount]      DECIMAL (18, 2) DEFAULT ((0)) NULL,
    [IsDebitOrCredit]   NVARCHAR (50)   NULL,
    [BalanceAmount]     DECIMAL (18, 2) NULL,
    [Remark]            VARCHAR (200)   NULL,
    [Comment]           VARCHAR (200)   NULL,
    [fkBranchID]        INT             NULL,
    [IsActive]          VARCHAR (20)    CONSTRAINT [DF_CashBooks_IsActive] DEFAULT ('Active') NULL,
    [InsertDate]        DATETIME        CONSTRAINT [DF_CashBooks_InsertDate] DEFAULT (getdate()) NULL,
    [ModifyDate]        DATETIME        NULL,
    [CreatedBy]         INT             NULL,
    [ModifiedBy]        INT             NULL,
    [fkBillID]          INT             NULL,
    [Sysdate]           DATETIME        CONSTRAINT [DF_CashBooks_Sysdate] DEFAULT (getdate()) NULL,
	fkAccountIDBook		 int
	,PaidAmount			 decimal(10,2)
	,Discount			 decimal(10,2)
	,MuddatAmount		 decimal(10,2)	
	,PaymentType		 varchar(100)
	,KalamType			 varchar(10)
	,fkItemSaleDetailIds varchar(max)
	,fkBillIds			 varchar(max)
	,IsPrimary			 bit
	,IsFarmer			 bit
	,IsParty			 bit,
    CONSTRAINT [PK_CashBooks_CashBookID]   PRIMARY KEY CLUSTERED ([CashBookID] ASC),
    CONSTRAINT [FK_CashBooks_Accounts_fkAccountID] FOREIGN KEY ([fkAccountID]) REFERENCES [dbo].[Accounts] ([AccountID])
);

