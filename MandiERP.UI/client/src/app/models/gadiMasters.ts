export interface GadiMasters {
    //id: number //added by me
    id:number;
    gadiMasterNo: number;
    gadiNo: string | null;
    address: string;
    city: string;
    state: string;
    country: string;
    pinCode: number;
    mobileNo: string;
    phoneNo: string;
    emailID: string;
    FaxNo: number;
    fkBranchID: number;
    IsActive: string;
    CreateBy: number;
    CreateDate: string;
    ModifyBy: number;
    ModifyDate: string;
    Sysdate: string;
}