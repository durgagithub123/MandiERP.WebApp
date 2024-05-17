Create PROCEDURE [dbo].[NarMaster_Get] 
AS
Select 
[NarCode],
[NarName],
[IsActive],
[ent_date],
[Sysdate]

from 
NarMaster
Return
