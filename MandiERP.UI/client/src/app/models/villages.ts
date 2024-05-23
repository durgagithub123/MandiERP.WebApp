export interface Village {
    
    id:number
    villageNo: number | null;
    villageName: string;
    villageNameHindi: string | null;
    state: string | null;
    zip: string | null;
    address: string | null;
    fkBranchId: number | null;
    isActive: string | null;
    createBy: number | null;
    createDate:string | null;
    modifyBy:number | null;
    modifyDate:string | null;
    sysdate:string | null;
}