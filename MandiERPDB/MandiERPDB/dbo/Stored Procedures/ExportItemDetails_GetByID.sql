
CREATE PROCEDURE [dbo].[ExportItemDetails_GetByID] 
	(
@ExportItemDetailID int
)
AS
SELECT	 
[ExportItemDetailID],
[ExportItemDetailNo],
[ExportItemDetailCode],
[fkExportMasterID],
[fkItemSaleDetailID],
[ItemSaleDetails],
[IsCompanyAccount],
[fkAccountID],
[PartyName],
[PartyShortName],
[fkItemTypeID],
[ItemName],
[fkItemUnitID],
[UnitName],
[Marca],
[TotalQuantity],
[AcutualQuantity],
[BillQuantity],
[ActualRate],
[BillRate],
[GrossWeight],
[BillGrossWeight],
[NetWeight],
[BillNetWeight],
[TotalAmount],
[BillTotalAmount],
[CommissionPercent],
[CommissionPercent2],
[BillCommissionPercent],
[CommissionAmount],
[BillCommissionAmount],
[TotalHammali],
[TotalTulai],
[TotalKhadiKari],
[NetAmount],
[BillNetAmount],
[TotalWeightCutting],
[lotDetail],
[TotalCarat],
[TotalCatte],
[TotalBhada],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

FROM 
ExportItemDetails  
WHERE 
[ExportItemDetailID]=@ExportItemDetailID


RETURN
