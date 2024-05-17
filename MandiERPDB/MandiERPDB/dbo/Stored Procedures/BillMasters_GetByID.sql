
CREATE PROCEDURE [dbo].[BillMasters_GetByID] 
	(
@BillMasterID int
)
AS
SELECT	 
[BillMasterID],
[fkBillID],
[fkAccountID],
[IsCompanyAccount],
[BillPaidStatus],
[IsCapital],
[BTQuantity],
[BTGrossWeight],
[BTCarat],
[BTNetWeight],
[BTAmount],
[BTDeduction],
[BTNetAmount],
[CTQuantity],
[CTGrossWeight],
[CTCarat],
[CTNetWeight],
[CTAmount],
[CTDeduction],
[CTNetAmount],
[IsShowonPage],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

FROM 
BillMasters  
WHERE 
[BillMasterID]=@BillMasterID


RETURN
