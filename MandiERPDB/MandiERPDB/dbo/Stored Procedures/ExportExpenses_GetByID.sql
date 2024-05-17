﻿
CREATE PROCEDURE [dbo].[ExportExpenses_GetByID] 
	(
@ExportExpenseID bigint
)
AS
SELECT	 
[ExportExpenseID],
[ExportExpenseNo],
[ExportExpenseCode],
[fkExportID],
[TotalGadiBhada],
[TotalAdvance],
[TotalHammali],
[TotalTulai],
[TotalBarwai],
[TotalMaidanHammali],
[TotalPalaKarai],
[TotalThelaBhada],
[TotalBardan],
[TotalOthersExp],
[TotalCommissionExp],
[TotalMandiTax],
[TotalLabourCharge],
[TotalDhulaiCharge],
[OtherExpense1],
[OtherExpense2],
[OtherExpense3],
[OtherExpense4],
[OtherExpense5],
[Other1],
[Other2],
[Other3],
[Other4],
[Other5],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[GatePassAmount],
[StoreBhadaAmount],
[DalaAmount]

FROM 
ExportExpenses  
WHERE 
[ExportExpenseID]=@ExportExpenseID


RETURN