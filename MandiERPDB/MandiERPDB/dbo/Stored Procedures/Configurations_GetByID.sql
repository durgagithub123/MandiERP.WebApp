
CREATE PROCEDURE [dbo].[Configurations_GetByID] 
	(
@ConfigurationID int
)
AS
SELECT	 
[ConfigurationID],
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

FROM 
Configurations  
WHERE 
[ConfigurationID]=@ConfigurationID


RETURN
