//import { EntityId } from "@reduxjs/toolkit";

export interface Unit {
    id:number;
    itemUnitNo: number | null;
    itemUnit: string | null;
    //itemUnit1: string;
    itemUnitHindi: string | null;
    rateOfUnitinKgs: number | null;
    percentComission: number | null;
    weightCuttingPerUnit: number | null;
    hammaliPerUnit: number | null;
    tulaiPerUnit: number | null;
    khadiKariPerUnit: number | null;
    weightCuttingPerUnit1: number | null;
    hammaliPerUnit1: number | null;
    tulaiPerUnit1: number | null;
    khadiKariPerUnit1: number | null;
    weightCuttingPerUnit2: number | null;
    hammaliPerUnit2: number | null;
    tulaiPerUnit2: number | null;
    khadiKariPerUnit2: number | null;
    weightCuttingPerUnit4: number | null;
    hammaliPerUnit4: number | null;
    tulaiPerUnit4: number | null;
    khadiKariPerUnit4: number | null;
    fkBranchId: number | null;
    isActive: string | null;
    createBy: number | null;
    createDate: string | null;
    modifyBy: number | null;
    modifyDate: string | null;
    sysdate: string | null;
  }