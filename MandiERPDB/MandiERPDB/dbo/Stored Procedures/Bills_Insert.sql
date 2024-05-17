﻿
CREATE PROCEDURE [dbo].[Bills_Insert] 
	(
@BillNo bigint,
@BillCode varchar(100)=null,
@BillCodeDetail varchar(100)=null,
@fkAccountID bigint=null,
@IsCompanyAccount varchar(50)=null,
@FirmPhoneNo varchar(50)=null,
@BillRsvrPersonName varchar(100)=null,
@BillRsvrPhoneNo varchar(50)=null,
@fkVillageID bigint=null,
@VillageName nvarchar(500)=null,
@BillDate datetime=null,
@BillPaidStatus nvarchar(15)=null,
@IsBillPrint varchar(10)=null,
@fkBillTypeID int=null,
@BillType nvarchar(50)=null,
@fkGadiMasterID int=null,
@TransPortName nvarchar(500)=null,
@GadiNo nvarchar(50)=null,
@IsBhadaPaid varchar(20)=null,
@GadiBhada decimal=null,
@PreviousBalance decimal=null,
@TotalSevaSulk decimal=null,
@TotalHammali decimal=null,
@TotalTulai decimal=null,
@TotalKhadiKarai decimal=null,
@TotalInam decimal=null,
@TotalStationary decimal=null,
@TotalPostageCharge decimal=null,
@TotalOtherCharges decimal=null,
@TotalPurchaseCommissionCharge decimal=null,
@TotalQuantity decimal=null,
@TotalAmount decimal=null,
@TotalDeduction decimal=null,
@NetAmount decimal=null,
@PaidAmount decimal=null,
@BalanceAmount decimal=null,
@Discount decimal=null,
@SalesTax decimal=null,
@VatTax decimal=null,
@OtherTax decimal=null,
@Comments nvarchar(100)=null,
@PaymentMode nvarchar(50)=null,
@BillingAddress nvarchar(255)=null,
@ShipingAddress nvarchar(255)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@SendBillToMandiOffice varchar(250)=null,
@GateParchiNo varchar(250)=null,
@AnubandNo varchar(250)=null,
@TolParchiNo varchar(250)=null,
@Other1 varchar(250)=null,
@Other2 varchar(250)=null,
@Other3 varchar(250)=null,
@Other4 varchar(250)=null,
@Other5 varchar(250)=null,
@AnubandNoSN varchar(250)=null,
@TolParchiNoSN varchar(250)=null,
@BhugtanNo varchar(250)=null,
@BhugtanNoSN varchar(250)=null,
@BookNo varchar(250)=null,
@Sysdate datetime=null,
@AawakDate date=null,
@BiltiNo varchar(250)=null,
@AddressDetail varchar(500)=null,
@StateDetails varchar(500)=null,
@BillPrintType varchar(500)=null
)
AS
Insert Into 
Bills 
(
[BillNo],
[BillCode],
[BillCodeDetail],
[fkAccountID],
[IsCompanyAccount],
[FirmPhoneNo],
[BillRsvrPersonName],
[BillRsvrPhoneNo],
[fkVillageID],
[VillageName],
[BillDate],
[BillPaidStatus],
[IsBillPrint],
[fkBillTypeID],
[BillType],
[fkGadiMasterID],
[TransPortName],
[GadiNo],
[IsBhadaPaid],
[GadiBhada],
[PreviousBalance],
[TotalSevaSulk],
[TotalHammali],
[TotalTulai],
[TotalKhadiKarai],
[TotalInam],
[TotalStationary],
[TotalPostageCharge],
[TotalOtherCharges],
[TotalPurchaseCommissionCharge],
[TotalQuantity],
[TotalAmount],
[TotalDeduction],
[NetAmount],
[PaidAmount],
[BalanceAmount],
[Discount],
[SalesTax],
[VatTax],
[OtherTax],
[Comments],
[PaymentMode],
[BillingAddress],
[ShipingAddress],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[SendBillToMandiOffice],
[GateParchiNo],
[AnubandNo],
[TolParchiNo],
[Other1],
[Other2],
[Other3],
[Other4],
[Other5],
[AnubandNoSN],
[TolParchiNoSN],
[BhugtanNo],
[BhugtanNoSN],
[BookNo],
[Sysdate],
[AawakDate],
[BiltiNo],
[AddressDetail],
[StateDetails],
[BillPrintType]
) 
values(
@BillNo,
@BillCode,
@BillCodeDetail,
@fkAccountID,
@IsCompanyAccount,
@FirmPhoneNo,
@BillRsvrPersonName,
@BillRsvrPhoneNo,
@fkVillageID,
@VillageName,
@BillDate,
@BillPaidStatus,
@IsBillPrint,
@fkBillTypeID,
@BillType,
@fkGadiMasterID,
@TransPortName,
@GadiNo,
@IsBhadaPaid,
@GadiBhada,
@PreviousBalance,
@TotalSevaSulk,
@TotalHammali,
@TotalTulai,
@TotalKhadiKarai,
@TotalInam,
@TotalStationary,
@TotalPostageCharge,
@TotalOtherCharges,
@TotalPurchaseCommissionCharge,
@TotalQuantity,
@TotalAmount,
@TotalDeduction,
@NetAmount,
@PaidAmount,
@BalanceAmount,
@Discount,
@SalesTax,
@VatTax,
@OtherTax,
@Comments,
@PaymentMode,
@BillingAddress,
@ShipingAddress,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@SendBillToMandiOffice,
@GateParchiNo,
@AnubandNo,
@TolParchiNo,
@Other1,
@Other2,
@Other3,
@Other4,
@Other5,
@AnubandNoSN,
@TolParchiNoSN,
@BhugtanNo,
@BhugtanNoSN,
@BookNo,
@Sysdate,
@AawakDate,
@BiltiNo,
@AddressDetail,
@StateDetails,
@BillPrintType
)
RETURN Scope_identity()