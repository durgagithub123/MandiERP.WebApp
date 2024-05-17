Create PROCEDURE [dbo].[UserCMS_Get] 
AS
Select 
[UserCMSID],
[UserCMSNo],
[Attribute],
[Value],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

from 
UserCMS
Return
