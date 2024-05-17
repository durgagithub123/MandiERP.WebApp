
Create PROCEDURE [dbo].[BillPaymentDetails_DeleteByID] 
	(
@BillPaymentDeatilID int
)
AS
Delete  from 
BillPaymentDetails 
where 
[BillPaymentDeatilID]=@BillPaymentDeatilID


Return
