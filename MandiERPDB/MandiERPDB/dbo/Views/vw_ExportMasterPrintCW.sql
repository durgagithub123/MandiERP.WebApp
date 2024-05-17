create VIEW [dbo].[vw_ExportMasterPrintCW]
AS
SELECT vw_ExportBilti.ExportMasterID
	,ExportMasterNo
	,vw_ExportBilti.ExportItemDetailID
	,vw_ExportBilti.ClientName
	,vw_ExportBilti.fkItemSaleDetailID
	,vw_ExportBilti.fkAccountID
	,vw_ExportBilti.ClientCity
	,vw_ExportBilti.AcutualQuantity
	,vw_ExportBilti.Marca
	,vw_ExportBilti.ActualRate
	,vw_ExportBilti.Rate
	,vw_ExportBilti.GrossWeight
	,vw_ExportBilti.NetWeight
	,vw_ExportBilti.TotalAmount
	,vw_ExportBilti.CommissionAmount
	,vw_ExportBilti.TotalHammali AS Expr1
	,vw_ExportBilti.TotalTulai AS Expr2
	,vw_ExportBilti.TotalKhadiKari
	,vw_ExportBilti.NetAmount
	,vw_ExportBilti.TotalCarat
	,vw_ExportBilti.TotalCatte
	,vw_ExportBilti.TotalBhada
	,vw_ExportBilti.DriverName
	,vw_ExportBilti.DriverPhoneNo
	,vw_ExportBilti.DriverInam
	,vw_ExportBilti.GadiBhada
	,vw_ExportBilti.AdvanceBhada
	,vw_ExportBilti.RemainingBhada
	,vw_ExportBilti.ReachDate
	,vw_ExportBilti.TimeToReach
	,vw_ExportBilti.PerKattaBhada
	,vw_ExportBilti.PerCaratBhada
	,vw_ExportBilti.ParBoriBhada
	,vw_ExportBilti.FakeMandiAmount
	,vw_ExportBilti.FakeMandiPercent
	,vw_ExportBilti.FakeMandiNetAmount
	,vw_ExportBilti.TotalExportAmount
	,vw_ExportBilti.TotalBillExportAmount
	,vw_ExportBilti.TotalExpenses
	,vw_ExportBilti.BillTotalExpenses
	,vw_ExportBilti.NetExportAmount
	,vw_ExportBilti.ClientFirmName
	,vw_ExportBilti.ClientShortName
	,CONVERT(VARCHAR(10), vw_ExportBilti.BiltiDate, 103) AS BiltiDate
	,vw_ExportBilti.BiltiDate AS BiltiDateActual
	,vw_ExportBilti.ItemName
	,vw_ExportBilti.UnitName
	,vw_ExportBilti.GadiNo
	,vw_ExportBilti.TotalHammaliText
	,vw_ExportBilti.MandiSulk
	,vw_panadetails.FarmerName AS FN1
	,dbo.fun_getFarmerNameByItemSaleDetailID(vw_panadetails.ItemSaleDetailID, 'FULL') AS FarmerName
	,vw_panadetails.FarmerShortName
	,vw_panadetails.fkBillDetailID
	,vw_panadetails.ItemSaleDetailID
	,vw_ExportBilti.AccountName
	,vw_ExportBilti.ItemCommissionAmount
	,vw_ExportBilti.ExportCode
	,vw_ExportBilti.ExportCodeDetail
	,ep.ExportExpenseID
	,ep.ExportExpenseNo
	,ep.ExportExpenseCode
	,ep.fkExportID
	,ep.TotalGadiBhada
	,ep.TotalAdvance
	,ep.TotalHammali
	,ep.TotalTulai
	,ep.TotalBarwai
	,ep.TotalMaidanHammali
	,ep.TotalPalaKarai
	,ep.TotalThelaBhada
	,ep.TotalBardan
	,ep.TotalOthersExp
	,ep.TotalCommissionExp
	,ep.TotalMandiTax
	,ep.TotalLabourCharge
	,ep.TotalDhulaiCharge
	,ep.OtherExpense1
	,ep.OtherExpense2
	,ep.OtherExpense3
	,ep.OtherExpense4
	,ep.OtherExpense5
	,ep.Other1
	,ep.Other2
	,ep.Other3
	,ep.Other4
	,ep.Other5
	,ep.IsActive
	,ep.CreateBy
	,ep.CreateDate
	,ep.ModifyBy
	,ep.GatePassAmount
	,ep.StoreBhadaAmount
	,ep.DalaAmount
FROM vw_ExportBilti
INNER JOIN vw_panadetails ON vw_ExportBilti.fkItemSaleDetailID = vw_panadetails.ItemSaleDetailID
INNER JOIN ExportExpenses AS ep ON ep.fkExportID = vw_ExportBilti.ExportMasterID



