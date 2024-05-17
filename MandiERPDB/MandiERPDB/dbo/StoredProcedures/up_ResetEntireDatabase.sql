Create PROCEDURE up_ResetEntireDatabase
@IncludeIdentReseed BIT,
@IncludeDataReseed BIT,
@SoftwareLocation INT = 1
AS

EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
EXEC sp_MSForEachTable 'DELETE FROM ?'

IF @IncludeIdentReseed = 1
BEGIN
    EXEC sp_MSForEachTable 'DBCC CHECKIDENT (''?'' , RESEED, 1)'
END

EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'

IF @IncludeDataReseed = 1 and @SoftwareLocation !=1
BEGIN
    Exec up_SetDefaultDataChindwada
END
ELSE
BEGIN
    Exec up_SetDefaultData
END
