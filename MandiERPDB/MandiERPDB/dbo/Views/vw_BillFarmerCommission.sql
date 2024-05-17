CREATE VIEW vw_BillFarmerCommission
AS

SELECT [fkBillID]
      ,SUM([BillTotalAmount]) BillTotalAmount
      ,ROUND( SUM([BillTotalAmount]) * 0.06 ,0)as CommissionAmount
  FROM [dbo].[BillDetails] where IsActive != '0'
GROUP BY [fkBillID]

