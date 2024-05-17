
CREATE PROCEDURE [dbo].[VoucherTypes_GetByID] 
	(
@VoucherTypeID int
)
AS
SELECT	 
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

FROM 
VoucherTypes  
WHERE 
[VoucherTypeID]=@VoucherTypeID


RETURN
