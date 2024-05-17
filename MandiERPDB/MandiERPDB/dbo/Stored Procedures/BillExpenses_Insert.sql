﻿
CREATE PROCEDURE [dbo].[BillExpenses_Insert] 
	(
@BillExpenseNo bigint,
@BillExpenseCode varchar(100)=null,
@fkBillID int=null,
@TotalGadiBhada decimal=null,
@TotalAdvance decimal=null,
@TotalHammali decimal=null,
@TotalTulai decimal=null,
@TotalBarwai decimal=null,
@TotalMaidanHammali decimal=null,
@TotalPalaKarai decimal=null,
@TotalThelaBhada decimal=null,
@TotalBardan decimal=null,
@TotalOthersExp decimal=null,
@TotalCommissionExp decimal=null,
@TotalMandiTax decimal=null,
@TotalLabourCharge decimal=null,
@TotalDhulaiCharge decimal=null,
@OtherExpense1 decimal=null,
@OtherExpense2 decimal=null,
@OtherExpense3 decimal=null,
@OtherExpense4 decimal=null,
@OtherExpense5 decimal=null,
@Other1 varchar(250)=null,
@Other2 varchar(250)=null,
@Other3 varchar(250)=null,
@Other4 varchar(250)=null,
@Other5 varchar(250)=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@GatePassAmount decimal=null,
@StoreBhadaAmount decimal=null,
@DalaAmount decimal=null
)
AS
Insert Into 
BillExpenses 
(
[BillExpenseNo],
[BillExpenseCode],
[fkBillID],
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
) 
values(
@BillExpenseNo,
@BillExpenseCode,
@fkBillID,
@TotalGadiBhada,
@TotalAdvance,
@TotalHammali,
@TotalTulai,
@TotalBarwai,
@TotalMaidanHammali,
@TotalPalaKarai,
@TotalThelaBhada,
@TotalBardan,
@TotalOthersExp,
@TotalCommissionExp,
@TotalMandiTax,
@TotalLabourCharge,
@TotalDhulaiCharge,
@OtherExpense1,
@OtherExpense2,
@OtherExpense3,
@OtherExpense4,
@OtherExpense5,
@Other1,
@Other2,
@Other3,
@Other4,
@Other5,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@GatePassAmount,
@StoreBhadaAmount,
@DalaAmount
)
RETURN Scope_identity()
