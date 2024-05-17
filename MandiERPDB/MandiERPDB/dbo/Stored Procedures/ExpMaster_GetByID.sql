
CREATE PROCEDURE [dbo].[ExpMaster_GetByID] 
	(
@ExpSNo int
)
AS
SELECT	 
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

FROM 
ExpMaster  
WHERE 
[ExpSNo]=@ExpSNo


RETURN
