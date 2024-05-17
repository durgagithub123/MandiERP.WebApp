Create PROCEDURE [dbo].[ExpMaster_Get] 
AS
Select 
[ExpSNo],
[ExpName],
[ExpAcd],
[ExpHindi],
[PIsActive],
[POrderNo],
[PExpType],
[PExpRate],
[SIsActive],
[SOrderNo],
[SExpType],
[SExpRate],
[FIsActive],
[FOrderNo],
[FExpType],
[FRate1],
[FRate2],
[Sysdate]

from 
ExpMaster
Return
