CREATE TABLE [dbo].[CashBookDetails]
(
	CashBookDetailID int identity(1,1) primary key
	,fkCashbookID int
	,KalamType varchar(10)
	,KalamDate Date
	,fkItemSaleDetailId int
	,fkBillId int
	,fkBillDetailID int
	,PaidAmount decimal(10,2)
	,Discount decimal(10,2)
	,MuddatAmount decimal(10,2)	
	,PaymentType varchar(100)
)
