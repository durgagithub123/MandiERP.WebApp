CREATE VIEW [dbo].[vw_Authentication]
AS
SELECT     dbo.Users.UserID, dbo.Roles.RoleID, dbo.UserDetails.FirstName, dbo.UserDetails.Middleame, dbo.UserDetails.LastName, dbo.Users.UserName, dbo.Users.IsAdmin, 
                      dbo.UserAccounts.Password, dbo.Roles.RoleName, dbo.UserLogin.LoginDate, dbo.UserLogin.Logout, dbo.UserLogin.LoginMessage, dbo.UserConfigs.HardwareID, 
                      dbo.UserConfigs.EncHardwareID, dbo.UserConfigs.MacAddress, dbo.UserConfigs.EncMacAddress, dbo.UserConfigs.IPAddress, dbo.UserConfigs.EncIPAddress, 
                      dbo.UserConfigs.WindowsUserName, dbo.UserConfigs.EncWindowsUserName
FROM         dbo.Users INNER JOIN
                      dbo.UserAccounts ON dbo.Users.UserID = dbo.UserAccounts.fkUserID INNER JOIN
                      dbo.UserDetails ON dbo.Users.UserID = dbo.UserDetails.fkUserID INNER JOIN
                      dbo.UserInRoles ON dbo.Users.UserID = dbo.UserInRoles.fkUserID INNER JOIN
                      dbo.Roles ON dbo.UserInRoles.fkRoleID = dbo.Roles.RoleID LEFT OUTER JOIN
                      dbo.UserLogin ON dbo.Users.UserID = dbo.UserLogin.fkUserID left JOIN
                      dbo.UserConfigs on 1=1
