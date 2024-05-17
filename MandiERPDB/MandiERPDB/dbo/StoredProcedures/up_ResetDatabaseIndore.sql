Create PROCEDURE [dbo].[up_ResetDatabaseIndore]
@IncludeIdentReseed BIT =1,
@IncludeDataReseed BIT=1,
@SoftwareLocation INT = 1
AS
BEGIN

EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
EXEC sp_MSForEachTable 'DELETE FROM ?'

IF @IncludeIdentReseed = 1
BEGIN
    EXEC sp_MSForEachTable 'DBCC CHECKIDENT (''?'' , RESEED, 1)'
END

EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'

 Exec up_SetDefaultDataIndore
END