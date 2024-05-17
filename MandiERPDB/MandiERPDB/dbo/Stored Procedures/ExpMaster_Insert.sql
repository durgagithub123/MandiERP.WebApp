
CREATE PROCEDURE [dbo].[ExpMaster_Insert] 
	(
@ExpSNo int,
@ExpName varchar(50)=null,
@ExpAcd int=null,
@ExpHindi varchar(50)=null,
@PIsActive varchar(3)=null,
@POrderNo int=null,
@PExpType varchar(10)=null,
@PExpRate float=null,
@SIsActive varchar(3)=null,
@SOrderNo int=null,
@SExpType varchar(10)=null,
@SExpRate float=null,
@FIsActive varchar(3)=null,
@FOrderNo int=null,
@FExpType varchar(10)=null,
@FRate1 float=null,
@FRate2 float=null,
@Sysdate datetime=null
)
AS
Insert Into 
ExpMaster 
(
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
) 
values(
@ExpSNo,
@ExpName,
@ExpAcd,
@ExpHindi,
@PIsActive,
@POrderNo,
@PExpType,
@PExpRate,
@SIsActive,
@SOrderNo,
@SExpType,
@SExpRate,
@FIsActive,
@FOrderNo,
@FExpType,
@FRate1,
@FRate2,
@Sysdate
)
RETURN Scope_identity()
