
CREATE PROCEDURE [dbo].[VoucherTypes_UpdateByID] 
	(
@VoucherTypeID int,
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
Update  VoucherTypes Set 
[VoucherName]=@VoucherName,
[VoucherNameHindi]=@VoucherNameHindi,
[IsAccount]=@IsAccount,
[Detail]=@Detail,
[Comment]=@Comment,
[IsActive]=@IsActive,
[InsertDate]=@InsertDate,
[ModifyDate]=@ModifyDate,
[CreatedBy]=@CreatedBy,
[ModifiedBy]=@ModifiedBy,
[Sysdate]=@Sysdate
 
where 
[VoucherTypeID]=@VoucherTypeID


Return
