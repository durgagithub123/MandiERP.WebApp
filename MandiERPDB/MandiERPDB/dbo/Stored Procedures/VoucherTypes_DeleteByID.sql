
Create PROCEDURE [dbo].[VoucherTypes_DeleteByID] 
	(
@VoucherTypeID int
)
AS
Delete  from 
VoucherTypes 
where 
[VoucherTypeID]=@VoucherTypeID


Return
