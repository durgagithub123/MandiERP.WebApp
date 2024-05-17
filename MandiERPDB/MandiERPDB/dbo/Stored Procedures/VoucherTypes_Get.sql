Create PROCEDURE [dbo].[VoucherTypes_Get] 
AS
Select 
[VoucherTypeID],
[VoucherName],
[VoucherNameHindi],
[IsAccount],
[Detail],
[Comment],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

from 
VoucherTypes
Return
