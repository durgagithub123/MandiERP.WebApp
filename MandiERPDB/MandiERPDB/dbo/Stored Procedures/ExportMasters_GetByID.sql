
CREATE PROCEDURE [dbo].[ExportMasters_GetByID] 
	(
@ExportMasterID int
)
AS
SELECT	 
[ExportMasterID],
[ExportMasterNo],
[ExportCode],
[ExportCodeDetail],
[fkAccountID],
[BiltiNo],
[IsExportBaki],
[IsExportBakiDetail],
[ExportMasterPaidStatus],
[BiltiDetail],
[BiltiDate],
[ClientName],
[fkVillageID],
[ClientCity],
[DriverName],
[DriverPhoneNo],
[DriverInam],
[GadiBhada],
[AdvanceBhada],
[RemainingBhada],
[ReachDate],
[TimeToReach],
[PerKattaBhada],
[PerCaratBhada],
[ParBoriBhada],
[FakeMandiAmount],
[FakeMandiPercent],
[FakeMandiNetAmount],
[TotalExportAmount],
[TotalBillExportAmount],
[TotalExpenses],
[BillTotalExpenses],
[NetExportAmount],
[BillNetExportAmount],
[GadiNo],
[TotalHammali],
[MandiSulk],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Address],
[Transport],
[Sysdate]

FROM 
ExportMasters  
WHERE 
[ExportMasterID]=@ExportMasterID


RETURN
