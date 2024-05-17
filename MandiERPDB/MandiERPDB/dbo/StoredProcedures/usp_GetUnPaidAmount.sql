CREATE proc [dbo].[usp_GetUnPaidAmount]
@AccountID bigint = NULL,
@Type varchar(50) = NULL
as
IF (@Type = 'BA')
begin
		--Select   BillID as ID,FarmerBillDetails as Detail FROM vw_BillDetail where  BillPaidStatus!='True' 
		;With CTEUnpaidBill as (
			select b.BillID 
			   ,CONVERT(varchar(50),SUM(b.BillNo)) + ' # ' +
			   dbo.fun_GetItemNameByBillID(b.BillID) + ' # '+
				CONVERT(varchar(50),SUM(bd.Quantity)) + ' # '+
				CONVERT(varchar(50),SUM(bd.BillNetWeight)) as Detail
				, SUM(bd.Quantity) as Quantity
				, SUM(bd.BillNetWeight) as BillNetWeight
			from Bills b inner join BillDetails bd on b.BillID = bd.fkBillID
			and bd.IsActive != '0'
			and IsCompanyAccount = 0
			 and b.fkAccountID = @AccountID 
			and isnull(b.BillCodeDetail,'') != 'Paid'
			group by BillID
			), CTEPaidAmount as 
			(
				SELECT     fkBillID, sum(isnull(PaidAmount,0)) as PaidAmount
				FROM         BillPayments bp inner join CTEUnpaidBill b on b.BillID = bp.fkBillID and bp.IsActive !='0'
				--  and b.fkAccountID = @AccountID 
				group by fkBillID
			)
			

           select b.BillID As ID
				, 'BillID' as ColumnKey
			   , Detail + ' # '+
				CONVERT(varchar(50),b.NetAmount) AS Detail
				,b.BillDate as TransactionDate			
				,dbo.fun_GetItemNameByBillID(b.BillID) as ItemName			
				,isnull(c.Quantity,0) as Quantity			
				,NULL as Rate			
				,isnull(c.BillNetWeight,0) as BillNetWeight			
				,isnull(b.TotalAmount,0) as TotalAmount			
				,isnull(b.NetAmount,0) as NetAmount			
				,isnull(cpa.PaidAmount,0) as PaidAmount			
				,isnull(b.NetAmount,0) - isnull(cpa.PaidAmount,0) as RemainingAmount			
				,0 as CurrentPaidAmount			
				,0 as CommissionAmount			
			from Bills b 
				inner join CTEUnpaidBill c on c.BillID = b.BillID
				left join CTEPaidAmount cpa on cpa.fkBillID = b.BillID
			and IsCompanyAccount = 0
			and b.IsActive != '0'
			-- b.fkAccountID = @AccountID 
			and isnull(b.BillCodeDetail,'') != 'Paid'
end
IF (@Type = 'PK')
begin		
		;With CTEUnpaidKharidiBill as (
			select b.BillID
				,b.BillNo
				,bd.BillDetailID 
			   ,'' as Detail
			   ,bd.BillDetailCode 
			   ,b.BillDate
			from Bills b inner join BillDetails bd on b.BillID = bd.fkBillID
			and bd.IsActive != '0'
			and IsCompanyAccount = 1
			 and b.fkAccountID = @AccountID 
			and isnull(bd.BillDetailCode,'') != 'Paid'
			), CTEPaidAmount as 
			(
				SELECT     fkBillDetailID, sum(isnull(PaidAmount,0)) as PaidAmount
				FROM         BillPayments bp inner join CTEUnpaidKharidiBill b on b.BillDetailID = bp.fkBillDetailID and bp.IsActive !='0'
				--  and b.fkAccountID = @AccountID 
				group by fkBillDetailID
			)
			
		select bd.BillDetailID As ID
				, 'BillDetailID' as ColumnKey
			   , CONVERT(varchar(50),c.BillNo) + ' # '+  bd.ItemName + ' # '+
				CONVERT(varchar(50),(bd.Quantity)) + ' # '+
				CONVERT(varchar(50),(bd.BillNetWeight)) + ' # '+
				CONVERT(varchar(50),bd.BillTotalAmount) AS Detail
				,c.BillDate as TransactionDate			
				,bd.ItemName as ItemName			
				,isnull(bd.Quantity,0) as Quantity			
				,bd.ActualRate as Rate			
				,isnull(bd.BillNetWeight,0) as BillNetWeight			
				,isnull(bd.ActualTotalAmount,0) as TotalAmount			
				,isnull(bd.BillTotalAmount,0) as NetAmount			
				,isnull(cpa.PaidAmount,0) as PaidAmount			
				,isnull(bd.BillTotalAmount,0) - isnull(cpa.PaidAmount,0) as RemainingAmount			
				,0 as CurrentPaidAmount			
				,ISNULL(bd.BillTotalAmount,0) - ISNULL(bd.ActualTotalAmount,0) as CommissionAmount			
			from BillDetails bd 
				inner join CTEUnpaidKharidiBill c on c.BillDetailID = bd.BillDetailID
				left join CTEPaidAmount cpa on cpa.fkBillDetailID = bd.BillDetailID
			and bd.IsActive != '0'
			-- b.fkAccountID = @AccountID 
			and isnull(bd.BillDetailCode,'') != 'Paid'

end

IF (@Type = 'PB')
begin		
		;With CTEUnpaidPana as (
			select isd.fkBillID
				,isd.ItemSaleDetailID
			   ,isd. ItemSaleCodeDetail
			   ,isd.CreateDate
			from ItemSaleDetails isd 
			where  isd.IsActive != '0'
			 and isd.fkAccountID = @AccountID 
			and isnull(isd.ItemSaleCodeDetail,'') != 'Paid'
			), CTEPaidAmount as 
			(
				SELECT     fkItemSaleDetailID, sum(isnull(PaidAmount,0)) as PaidAmount
				FROM         BillPayments bp inner join CTEUnpaidPana b on b.ItemSaleDetailID = bp.fkItemSaleDetailID and bp.IsActive !='0'
				group by fkItemSaleDetailID
			)
			
		select isd.ItemSaleDetailID As ID
				, 'ItemSaleDetailID' as ColumnKey
			   , 
			   --CONVERT(varchar(50),c.BillNo) + ' # '+  
			   bd.ItemName + ' # '+
				CONVERT(varchar(50),(isd.Quantity)) + ' # '+
				CONVERT(varchar(50),(isd.NetWeight)) + ' # '+
				CONVERT(varchar(50),isd.TotalAmount) AS Detail
				,isd.CreateDate as TransactionDate			
				,bd.ItemName as ItemName			
				,isnull(isd.Quantity,0) as Quantity			
				,isd.Rate as Rate			
				,isnull(isd.NetWeight,0) as BillNetWeight			
				,(isnull(isd.TotalAmount,0) - ISNULL(isd.CommissionAmount,0)) as TotalAmount			
				,isnull(isd.TotalAmount,0) as NetAmount			
				,isnull(cpa.PaidAmount,0) as PaidAmount			
				,isnull(isd.TotalAmount,0) - isnull(cpa.PaidAmount,0) as RemainingAmount			
				,0 as CurrentPaidAmount			
				,ISNULL(isd.CommissionAmount,0) as CommissionAmount			
			from ItemSaleDetails isd
				inner join BillDetails bd on isd.fkBillDetailID = bd.BillDetailID 
				inner join CTEUnpaidPana c on c.ItemSaleDetailID = isd.ItemSaleDetailID
				left join CTEPaidAmount cpa on cpa.fkItemSaleDetailID = isd.ItemSaleDetailID
			and isd.IsActive != '0'

end

IF (@Type = 'EP')
begin
		--Select   BillID as ID,FarmerBillDetails as Detail FROM vw_BillDetail where  BillPaidStatus!='True' 
		;With CTEUnpaidBill as (
			select em.ExportMasterID 
			   ,CONVERT(varchar(50),em.BiltiNo ) + ' # ' +
			   dbo.fun_GetItemNameByExportMasterID(em.ExportMasterID) + ' # '+
				CONVERT(varchar(50),SUM(eid.AcutualQuantity)) + ' # '+
				CONVERT(varchar(50),SUM(eid.NetWeight)) as Detail
				, SUM(eid.AcutualQuantity) as Quantity
				, SUM(eid.NetWeight) as BillNetWeight
			from ExportMasters em  inner join ExportItemDetails eid on em.ExportMasterID = eid.fkExportMasterID
			and eid.IsActive != '0'
			--and IsCompanyAccount = 0
			 and em.fkAccountID = @AccountID 
			and isnull(em.ExportCodeDetail,'') != 'Paid'
			group by ExportMasterID,em.BiltiNo
			), CTEPaidAmount as 
			(
				SELECT     fkExportMasterID, sum(isnull(PaidAmount,0)) as PaidAmount
				FROM         BillPayments bp inner join CTEUnpaidBill em on em.ExportMasterID = bp.fkExportMasterID and bp.IsActive !='0'
				--  and b.fkAccountID = @AccountID 
				group by fkExportMasterID
			)
			

           select em.ExportMasterID As ID
				, 'ExportBilti' as ColumnKey
			   , Detail + ' # '+
				CONVERT(varchar(50),em.BillNetExportAmount) AS Detail
				,em.BiltiDate as TransactionDate			
				,dbo.fun_GetItemNameByExportMasterID(em.ExportMasterID) as ItemName			
				,isnull(c.Quantity,0) as Quantity			
				,NULL as Rate			
				,isnull(c.BillNetWeight,0) as BillNetWeight			
				,isnull(em.BillNetExportAmount,0) as TotalAmount			
				,isnull(em.BillNetExportAmount,0) as NetAmount			
				,isnull(cpa.PaidAmount,0) as PaidAmount			
				,isnull(em.BillNetExportAmount,0) - isnull(cpa.PaidAmount,0) as RemainingAmount			
				,0 as CurrentPaidAmount			
				,0 as CommissionAmount			
			from ExportMasters em
				inner join CTEUnpaidBill c on c.ExportMasterID = em.ExportMasterID
				left join CTEPaidAmount cpa on cpa.fkExportMasterID = em.ExportMasterID
			--and IsCompanyAccount = 0
			and em.IsActive != '0'
			-- b.fkAccountID = @AccountID 
			and isnull(em.ExportCodeDetail,'') != 'Paid'
end


