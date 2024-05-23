export interface Item {
  id: number;
  itemTypeNo: number | null;
  itemName: string;
  itemNameHindi: string | null;
  rateOfUnitinKgs: number | null;
  percentComission: number | null;
  fkBranchID: number | null;
  isActive: string | null;
  createBy: number | null;
  createDate: string | null;
  modifyBy: number | null;
  modifyDate: string | null;
  sysDate: string | null;
}