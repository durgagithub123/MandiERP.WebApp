
CREATE PROCEDURE [dbo].[Configurations_UpdateByID] 
	(
@ConfigurationID int,
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
Update  Configurations Set 
[ConfigurationNo]=@ConfigurationNo,
[CompanyAccountID]=@CompanyAccountID,
[HammaliAccountID]=@HammaliAccountID,
[PurchaseCommission]=@PurchaseCommission,
[SaleCommission]=@SaleCommission,
[RateParKiloGram]=@RateParKiloGram,
[Tax]=@Tax,
[SevaSulk]=@SevaSulk,
[OtherCharges]=@OtherCharges,
[Hammali]=@Hammali,
[Tulai]=@Tulai,
[KhadiKarai]=@KhadiKarai,
[Stationary]=@Stationary,
[OtherExp]=@OtherExp,
[Other1]=@Other1,
[Other2]=@Other2,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[TolPatrakNo]=@TolPatrakNo,
[AnubandhNo]=@AnubandhNo,
[BhugtanNo]=@BhugtanNo,
[Sysdate]=@Sysdate
 
where 
[ConfigurationID]=@ConfigurationID


Return
