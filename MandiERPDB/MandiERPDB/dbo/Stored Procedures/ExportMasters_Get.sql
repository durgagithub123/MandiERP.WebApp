﻿Create PROCEDURE [dbo].[ExportMasters_Get] 
AS
Select 
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

from 
ExportMasters
Return
