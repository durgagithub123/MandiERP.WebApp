export interface ExportItemDetails {
    
    exportItemDetailID: number
    exportItemDetailNo: number
    exportItemDetailCode: string
    fkexportMasterID : number
    fkitemSaleDetailID : number
    itemSaleDetails : string
    isCompanyAccount:string
    fkaccountID : number
    partyName : string
    partyShortName : string
    fkitemTypeID : number
    itemName : string
    fkitemUnitID : number
    unitName : string
    marca : string
    totalQuantity : number
    acutualQuantity : number
    billQuantity : number
    actualRate : number
    billRate : number
    grossWeight : number
    billGrossWeight : number
    netWeight : number
    billNetWeight : number
    totalAmount : number
    billTotalAmount : number
    commissionPercent : number
    commissionPercent2 : number
    billCommissionPercent : number
    commissionAmount : number
    billCommissionAmount : number
    totalHammali : number
    totalTulai : number
    totalKhadiKari : number
    netAmount : number
    billNetAmount : number
    totalWeightCutting : number
    lotDetail : string
    totalCarat : number 
    totalCatte : number
    totalBhada : number
    fkbranchID : number
    isActive : string
    insertDate : string
    modifyDate : string
    createdBy : number
    modifiedBy : number
    sysdate : string
}