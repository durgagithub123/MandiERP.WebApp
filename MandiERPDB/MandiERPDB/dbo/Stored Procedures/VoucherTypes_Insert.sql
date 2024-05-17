
CREATE PROCEDURE [dbo].[VoucherTypes_Insert] 
	(
@VoucherName varchar(250)=null,
@VoucherNameHindi nvarchar(250)=null,
@IsAccount varchar(20)=null,
@Detail varchar(50)=null,
@Comment varchar(50)=null,
@IsActive varchar(20)=null,
@InsertDate datetime=null,
@ModifyDate datetime=null,
@CreatedBy int=null,
@ModifiedBy int=null,
@Sysdate datetime=null
)
AS
Insert Into 
VoucherTypes 
(
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
) 
values(
@VoucherName,
@VoucherNameHindi,
@IsAccount,
@Detail,
@Comment,
@IsActive,
@InsertDate,
@ModifyDate,
@CreatedBy,
@ModifiedBy,
@Sysdate
)
RETURN Scope_identity()
