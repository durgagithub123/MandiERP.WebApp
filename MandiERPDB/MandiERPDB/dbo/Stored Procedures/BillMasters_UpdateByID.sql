
CREATE PROCEDURE [dbo].[BillMasters_UpdateByID] 
	(
@BillMasterID int,
@fkBillID bigint,
@fkAccountID bigint,
@IsCompanyAccount varchar(50)=null,
@BillPaidStatus varchar(50)=null,
@IsCapital varchar(10)=null,
@BTQuantity decimal=null,
@BTGrossWeight decimal=null,
@BTCarat varchar(4000)=null,
@BTNetWeight decimal=null,
@BTAmount decimal=null,
@BTDeduction decimal=null,
@BTNetAmount decimal=null,
@CTQuantity decimal=null,
@CTGrossWeight decimal=null,
@CTCarat varchar(4000)=null,
@CTNetWeight decimal=null,
@CTAmount decimal=null,
@CTDeduction decimal=null,
@CTNetAmount decimal=null,
@IsShowonPage varchar(10)=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Update  BillMasters Set 
[fkBillID]=@fkBillID,
[fkAccountID]=@fkAccountID,
[IsCompanyAccount]=@IsCompanyAccount,
[BillPaidStatus]=@BillPaidStatus,
[IsCapital]=@IsCapital,
[BTQuantity]=@BTQuantity,
[BTGrossWeight]=@BTGrossWeight,
[BTCarat]=@BTCarat,
[BTNetWeight]=@BTNetWeight,
[BTAmount]=@BTAmount,
[BTDeduction]=@BTDeduction,
[BTNetAmount]=@BTNetAmount,
[CTQuantity]=@CTQuantity,
[CTGrossWeight]=@CTGrossWeight,
[CTCarat]=@CTCarat,
[CTNetWeight]=@CTNetWeight,
[CTAmount]=@CTAmount,
[CTDeduction]=@CTDeduction,
[CTNetAmount]=@CTNetAmount,
[IsShowonPage]=@IsShowonPage,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[BillMasterID]=@BillMasterID


Return
