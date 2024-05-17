Create PROCEDURE [dbo].[Admins_Get] 
AS
Select 
[AdminID],
[UserName],
[Password],
[IsAdmin],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]

from 
Admins
Return
