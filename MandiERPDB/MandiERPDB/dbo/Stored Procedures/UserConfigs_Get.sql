Create PROCEDURE [dbo].[UserConfigs_Get] 
AS
Select 
[ID],
[HardwareID],
[EncHardwareID],
[MacAddress],
[EncMacAddress],
[IPAddress],
[EncIPAddress],
[WindowsUserName],
[EncWindowsUserName],
[Sysdate]

from 
UserConfigs
Return
