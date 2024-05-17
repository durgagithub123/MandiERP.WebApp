CREATE PROCEDURE [dbo].[usp_BackupDB]
	-- Add the parameters for the stored procedure here
	
AS
begin
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/*Backup */
DECLARE @name VARCHAR(50)
DECLARE @fileName VARCHAR(256)
DECLARE @fileDate VARCHAR(20) 

SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) 

declare @dbname varchar(250)
set @dbname = DB_NAME()
--Change TestParcel to AcutalDatabaseName
--SET @fileName = 'E:\DATA\Backup\MandiERP_28_02' +  '_' + @fileDate + '.BAK' 
SET @fileName = 'D:\MandiERP\2021\DBBackup\' +@dbname+  '_' + @fileDate + '.BAK' 

--Change TestParcel to AcutalDatabaseName
BACKUP DATABASE @dbname TO  DISK = @fileName WITH NOFORMAT, NOINIT,  NAME = N'Portfolio-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
end
