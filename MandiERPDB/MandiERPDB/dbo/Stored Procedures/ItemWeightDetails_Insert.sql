
CREATE PROCEDURE [dbo].[ItemWeightDetails_Insert] 
	(
@ItemWeightDetailNo int=null,
@fkBillDetailID bigint,
@WeightinKGM decimal=null,
@fkBranchID int=null,
@IsActive varchar(20)=null,
@CreateBy int=null,
@CreateDate datetime=null,
@ModifyBy int=null,
@ModifyDate datetime=null,
@Sysdate datetime=null
)
AS
Insert Into 
ItemWeightDetails 
(
[ItemWeightDetailNo],
[fkBillDetailID],
[WeightinKGM],
[fkBranchID],
[IsActive],
[CreateBy],
[CreateDate],
[ModifyBy],
[ModifyDate],
[Sysdate]
) 
values(
@ItemWeightDetailNo,
@fkBillDetailID,
@WeightinKGM,
@fkBranchID,
@IsActive,
@CreateBy,
@CreateDate,
@ModifyBy,
@ModifyDate,
@Sysdate
)
RETURN Scope_identity()
