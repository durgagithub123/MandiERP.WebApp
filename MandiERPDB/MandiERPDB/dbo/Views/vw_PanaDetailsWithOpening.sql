CREATE VIEW [dbo].[vw_PanaDetailsWithOpening]
AS
SELECT 
  AccountID, 
  AccountFirmName, 
  FarmerName, 
  AccountNo, 
  AccountName, 
  AccountMobileNo, 
  ItemSaleDetailID, 
  ItemSaleDetailNo, 
  fkAccountID, 
  IsCompanyAccount, 
  fkBillDetailID, 
  Quantity, 
  Rate, 
  GrossWeight, 
  WeightDetails, 
  NetWeight, 
  CommissionPercent, 
  CommissionAmount, 
  ActualTotalAmount, 
  TotalAmount, 
  BillDate AS BillDate, 
  SaleDate AS TransactionDate, 
  BillID, 
  BillNo, 
  BillDetailID, 
  BillDetailNo, 
  ItemName, 
  ItemUnit, 
  IsPurchaser, 
  VillageName, 
  fkVillageID, 
  SaleTypeFixOrWeightBased, 
  NetTotalAmount, 
  BillRate, 
  BNetWeight, 
  BActualTotalAmount, 
  BCommissionAmount, 
  BillTotalAmount, 
  ItemMarca, 
  IsPanaPaid, 
  [PanaPaidDate], 
  [IsActive], 
  [ItemUnitName], 
  [TotalAmount1], 
  [Remark], 
  [SaleDate], 
  [FarmerShortName],
  CASE IsPurchaser WHEN 0 THEN 'B-' + CONVERT(
    VARCHAR(10), 
    BillNo
  ) + '-' + CONVERT(
    VARCHAR(10), 
    fkBillDetailID
  ) + '-' + CONVERT(
    VARCHAR(10), 
    ItemSaleDetailID
  ) WHEN 1 THEN 'P-' + CONVERT(
    VARCHAR(10), 
    BillNo
  ) + '-' + CONVERT(
    VARCHAR(10), 
    fkBillDetailID
  ) + '-' + CONVERT(
    VARCHAR(10), 
    ItemSaleDetailID
  ) END AS BillPanaDetails, 
  dbo.fn_GetPanaAmount(
    fkAccountID, '05-Jul-2022 12:00:00 AM', 
    '05-Jul-2022 12:00:00 AM', 'OB'
  ) AS OpeningBalance, 
  dbo.fn_GetPanaAmount(
    fkAccountID, '05-Jul-2022 12:00:00 AM', 
    '05-Jul-2022 12:00:00 AM', 'AR'
  ) AS AmountReceived, 
  dbo.fn_GetPanaAmount(
    fkAccountID, '05-Jul-2022 12:00:00 AM', 
    '05-Jul-2022 12:00:00 AM', 'AP'
  ) AS AmountPaid, 
  dbo.fn_GetPanaAmount(
    fkAccountID, '05-Jul-2022 12:00:00 AM', 
    '05-Jul-2022 12:00:00 AM', 'TP'
  ) AS Purchase, 
  dbo.fn_GetPanaAmount(
    fkAccountID, '05-Jul-2022 12:00:00 AM', 
    '05-Jul-2022 12:00:00 AM', 'TS'
  ) AS Sale
FROM 
  dbo.vw_panadetails
