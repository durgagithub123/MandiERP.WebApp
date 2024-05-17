CREATE PROC [dbo].[uspInsertUpdateRateDifference]
(	
	@TransationDate DATETIME = '19000101',
	@BillDetailID INT = 0,
	@ExportMasterID INT = 0,
	@ItemSaleDetailID INT = 0
)
AS
BEGIN
	if(@BillDetailID > 0 )
	begin
		EXEC uspRateDiffSalePurchase @BillDetailID
	end
	IF (@ItemSaleDetailID > 0)
	BEGIN
		WHILE 1 = 1
		BEGIN
			SET @BillDetailID = (
					SELECT MIN(BillDetailID)
					FROM BillDetails bd 
					inner join ItemSaleDetails isd on
					isd.fkBillDetailID = bd.BillDetailID
					WHERE bd.IsActive != '0'
						AND bd.BillDetailID > @BillDetailID
						and isd.ItemSaleDetailID = @ItemSaleDetailID
					)

			EXEC uspRateDiffSalePurchase @BillDetailID

			IF (@BillDetailID IS NULL)
				BREAK;
		END
	END
	IF (@ExportMasterID > 0)
	BEGIN
		WHILE 1 = 1
		BEGIN
			SET @BillDetailID = (
					SELECT MIN(BillDetailID)
					FROM BillDetails bd 
					inner join ItemSaleDetails isd on
					isd.fkBillDetailID = bd.BillDetailID
					inner join ExportItemDetails eid on 
						eid.fkItemSaleDetailID = isd.ItemSaleDetailID
					WHERE bd.IsActive != '0'
						AND bd.BillDetailID > @BillDetailID
						and eid.fkExportMasterID = @ExportMasterID
					)

				IF EXISTS (SELECT 1 
				FROM ItemSaleDetails isd 
				WHERE isd.fkBillDetailID = @BillDetailID
				GROUP BY fkBillDetailID
				HAVING COUNT(fkBillDetailID) > 1 )
					BEGIN
						EXEC uspRateDiffSalePurchase @BillDetailID
					END
			IF (@BillDetailID IS NULL)
				BREAK;
		END
	END
	IF (CONVERT(varchar(10), @TransationDate,112) != '19000101')
	BEGIN
		WHILE 1 = 1
		BEGIN
			SET @BillDetailID = (
					SELECT MIN(BillDetailID)
					FROM BillDetails bd 
					inner join ItemSaleDetails isd on
					isd.fkBillDetailID = bd.BillDetailID
					WHERE bd.IsActive != '0'
						AND bd.BillDetailID > @BillDetailID
						and CONVERT(varchar(50), isd.CreateDate,112) = CONVERT(varchar(50), @TransationDate,112)
					)

			EXEC uspRateDiffSalePurchase @BillDetailID

			IF (@BillDetailID IS NULL)
				BREAK;
		END
	END
END


