
CREATE PROCEDURE [dbo].[ItemWeightDetails_UpdateByID] 
	(
@ItemWeightDetailID int,
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
Update  ItemWeightDetails Set 
[ItemWeightDetailNo]=@ItemWeightDetailNo,
[fkBillDetailID]=@fkBillDetailID,
[WeightinKGM]=@WeightinKGM,
[fkBranchID]=@fkBranchID,
[IsActive]=@IsActive,
[CreateBy]=@CreateBy,
[CreateDate]=@CreateDate,
[ModifyBy]=@ModifyBy,
[ModifyDate]=@ModifyDate,
[Sysdate]=@Sysdate
 
where 
[ItemWeightDetailID]=@ItemWeightDetailID


Return
