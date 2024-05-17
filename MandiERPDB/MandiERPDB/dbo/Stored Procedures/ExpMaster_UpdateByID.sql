
CREATE PROCEDURE [dbo].[ExpMaster_UpdateByID] 
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
Update  ExpMaster Set 
[ExpSNo]=@ExpSNo,
[ExpName]=@ExpName,
[ExpAcd]=@ExpAcd,
[ExpHindi]=@ExpHindi,
[PIsActive]=@PIsActive,
[POrderNo]=@POrderNo,
[PExpType]=@PExpType,
[PExpRate]=@PExpRate,
[SIsActive]=@SIsActive,
[SOrderNo]=@SOrderNo,
[SExpType]=@SExpType,
[SExpRate]=@SExpRate,
[FIsActive]=@FIsActive,
[FOrderNo]=@FOrderNo,
[FExpType]=@FExpType,
[FRate1]=@FRate1,
[FRate2]=@FRate2,
[Sysdate]=@Sysdate
 
where 
[ExpSNo]=@ExpSNo


Return
