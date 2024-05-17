﻿create view [dbo].[vw_BillPaidAmountFinal]
as

SELECT [BillID]
      ,[BillNo]
      ,[AccountID]
      ,[AccountFirmName]
      ,[AccountFirmNameHindi]
      ,[AccountSortName]
      ,[AccountName]
      ,[fkVillageID]
      ,[VillageID]
      ,[VillageName]
      ,[BillDate]
      ,[BillPaidStatus]
      ,[IsBillPrint]
      ,[fkBillID]
      ,[Quantity]
      ,[ActualTotalAmount]
      ,[PaidAmount]
      ,[RemainingAmount]
  FROM [dbo].[vw_BillPaidAmountAccountDetails]
  inner join [dbo].[vw_BillTotalAmountReport] on
  [vw_BillPaidAmountAccountDetails].[BillID]=[vw_BillTotalAmountReport].[fkBillID]
