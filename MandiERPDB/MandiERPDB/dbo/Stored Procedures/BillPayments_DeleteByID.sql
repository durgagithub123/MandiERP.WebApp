
Create PROCEDURE [dbo].[BillPayments_DeleteByID] 
	(
@BillPaymentID bigint
)
AS
Delete  from 
BillPayments 
where 
[BillPaymentID]=@BillPaymentID


Return
