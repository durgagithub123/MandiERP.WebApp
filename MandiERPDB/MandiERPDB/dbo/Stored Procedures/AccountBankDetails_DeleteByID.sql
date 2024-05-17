
Create PROCEDURE [dbo].[AccountBankDetails_DeleteByID] 
	(
@AccountBankDetailID bigint
)
AS
Delete  from 
AccountBankDetails 
where 
[AccountBankDetailID]=@AccountBankDetailID


Return
