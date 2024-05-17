
CREATE PROCEDURE [dbo].[AccountDetails_GetByID] 
	(
@AccountDetailID bigint
)
AS
SELECT	 
[AccountDetailID],
[AccountDetailNo],
[fkAccountID],
[Name],
[NameHindi],
[MobileNo],
[PhoneNo],
[Address1],
[Address2],
[City],
[State],
[Zip],
[Country],
[PanNo],
[fkBranchID],
[IsActive],
[InsertDate],
[ModifyDate],
[CreatedBy],
[ModifiedBy],
[Sysdate]

FROM 
AccountDetails  
WHERE 
[AccountDetailID]=@AccountDetailID


RETURN
