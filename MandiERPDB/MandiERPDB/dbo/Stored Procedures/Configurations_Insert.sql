﻿
CREATE PROCEDURE [dbo].[Configurations_Insert] 
	(
@ConfigurationNo int=null,
@CompanyAccountID int=null,
@HammaliAccountID int=null,
@PurchaseCommission decimal=null,
@SaleCommission decimal=null,
@RateParKiloGram decimal=null,
@Tax decimal=null,
@SevaSulk decimal=null,
@OtherCharges decimal=null,
@Hammali decimal=null,
@Tulai decimal=null,
@KhadiKarai decimal=null,
@Stationary decimal=null,
@OtherExp decimal=null,
@Other1 decimal=null,
@Other2 decimal=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@TolPatrakNo varchar(250)=null,
@AnubandhNo varchar(250)=null,
@BhugtanNo varchar(250)=null,
@Sysdate datetime=null
)
AS
Insert Into 
Configurations 
(
[ConfigurationNo],
[CompanyAccountID],
[HammaliAccountID],
[PurchaseCommission],
[SaleCommission],
[RateParKiloGram],
[Tax],
[SevaSulk],
[OtherCharges],
[Hammali],
[Tulai],
[KhadiKarai],
[Stationary],
[OtherExp],
[Other1],
[Other2],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[TolPatrakNo],
[AnubandhNo],
[BhugtanNo],
[Sysdate]
) 
values(
@ConfigurationNo,
@CompanyAccountID,
@HammaliAccountID,
@PurchaseCommission,
@SaleCommission,
@RateParKiloGram,
@Tax,
@SevaSulk,
@OtherCharges,
@Hammali,
@Tulai,
@KhadiKarai,
@Stationary,
@OtherExp,
@Other1,
@Other2,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@TolPatrakNo,
@AnubandhNo,
@BhugtanNo,
@Sysdate
)
RETURN Scope_identity()