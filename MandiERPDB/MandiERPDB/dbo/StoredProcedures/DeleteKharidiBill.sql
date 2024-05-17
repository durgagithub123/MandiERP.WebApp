CREATE PROC [dbo].[DeleteKharidiBill] @ItemSaleDetailID INT
AS
BEGIN
	declare @BillDetailID int 
	set @BillDetailID = (SELECT fkBillDetailID
			FROM ItemSaleDetails
			WHERE ItemSaleDetailID = @ItemSaleDetailID) 

	UPDATE AccountTransactions
	SET IsActive = '0'
	WHERE fkBillDetailID = @BillDetailID
		AND IsActive != '0'

	UPDATE AccountTransactions
	SET IsActive = '0'
	WHERE fkItemSaleDetailID = @ItemSaleDetailID
		AND IsActive != '0'

	UPDATE ItemSaleDetails
	SET IsActive = '0'
	WHERE fkBillDetailID = @BillDetailID
		AND IsActive != '0'

	UPDATE BillDetails
	SET IsActive = '0'
	WHERE BillDetailID =@BillDetailID
		AND IsActive != '0'

END
