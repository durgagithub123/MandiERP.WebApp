import axios, { AxiosResponse, AxiosError } from 'axios';
import { BASE_URL } from '../../settings';

// Define the base URL of your API
axios.defaults.baseURL = BASE_URL;

const responseBody = (response: AxiosResponse) => response.data;

// Define your API methods
const requests = {
    get: (url: string, params?: URLSearchParams) => {
        try {
          const response = axios.get(url, {
            params: {
            },
          });
          return response; // Return the Axios response directly
          //console.log('=============>>>>',response,)
        } catch (error) {
          throw error as AxiosError;
        }
      },
     post: (url: string, body: {}) => axios.post(url, body).then(responseBody),
     put: (url: string, body: {}) => axios.put(url, body).then(responseBody),
     delete: (url: string) => axios.delete(url).then(responseBody),
     patch: (url: string, body: {}) => axios.patch(url, body).then(responseBody)
}
//https://localhost:7071/api/Village
const Village = {
  getVillage: () => requests.get('/api/Village'),
  createVillage: (data: any) => requests.post('/api/Village', data),
  updateVillage: (id:number,data: any) => requests.put(`/api/Village/${id}`, data),
  deleteVillage: (id: number) => requests.delete(`/api/Village/${id}`),
 }
 //https://localhost:7071/api/ItemType
 const Item = {
  getItem: () => requests.get('/api/ItemType'),
  createItem: (data: any) => requests.post('/api/ItemType', data),
  updateItem: (id:number,data: any) => requests.put(`/api/ItemType/${id}`, data),
  deleteItem: (id: number) => requests.delete(`/api/ItemType/${id}`),
 }
//https://localhost:7071/api/ItemUnit
const Unit = {
  getUnit: () => requests.get('/api/ItemUnit'),
  createUnit: (data: any) => requests.post('/api/ItemUnit', data),
  updateUnit: (id:number,data: any) => requests.put(`/api/ItemUnit/${id}`, data),
  deleteUnit: (id: number) => requests.delete(`/api/ItemUnit/${id}`)
}
//https://localhost:7071/api/Account
const Account = {
  getAccount: () => requests.get('/api/Account'),
  createAccount: (data: any) => requests.post('/api/Account', data),
  updateAccount: (id:number,data: any) => requests.put(`/api/Account/${id}`, data),
  deleteAccount: (id: number) => requests.delete(`/api/Account/${id}`)
}
//https://localhost:5000/api/AccountBankDetails
// const AccountBankDetail = {
//   getAccountBankDetail: () => requests.get('/api/AccountBankDetails'),
//   createAccountBankDetail: (data: any) => requests.post('/api/AccountBankDetails', data),
//   updateAccountBankDetail: (id:number,data: any) => requests.put(`/api/AccountBankDetails/${id}`, data),
//   deleteAccountBankDetail: (id: number) => requests.delete(`/api/AccountBankDetails/${id}`)
// }

//https://localhost:5000/api/AccountTypes
// const AccountTpes = {
//   getAccountType: () => requests.get('/api/AccountTypes'),
//   createAccounTypest: (data: any) => requests.post('/api/AccountTypes', data),
// }

//Durga's : https://localhost:5000/api/Bills
// const Bill = {
//   getBill: () => requests.get('/api/Bills'),
//   createBill: (data: any) => requests.post('/api/Bills', data),
//   updateBill: (id:number,data: any) => requests.put(`/api/Bills/${id}`, data),
//   deleteBill: (id: number) => requests.delete(`/api/Bills/${id}`)
// }
//https://localhost:5000/api/BillDetails

// const BillDetail = {
//   getBillDetail: () => requests.get('/api/BillDetails'),
//   createBillDetail: (data: any) => requests.post('/api/BillDetails', data),
//   updateBillDetail: (id:number,data: any) => requests.put(`/api/BillDetails/${id}`, data),
//   updatedBillDetail: (id: number, data: any) => requests.patch(`/api/BillDetails/${id}`, data),
//   deleteBillDetails: (id: number) => requests.delete(`/api/BillDetails/${id}`)
// }

//https://localhost:5000/api/ItemSaleDetails

// const ItemSaleDetail = {
//   getItemSaleDetail: () => requests.get('/api/ItemSaleDetails'),
//   createItemSaleDetail: (data: any) => requests.post('/api/ItemSaleDetails', data),
//   updateItemSaleDetail: (id:number,data: any) => requests.put(`/api/ItemSaleDetails/${id}`, data),
//   deleteItemSaleDetail: (id: number) => requests.delete(`/api/ItemSaleDetails/${id}`),
// }

//https://localhost:5000/api/GadiMasters
// const GadiMasters = {
//   getGadiMasters: () => requests.get('/api/GadiMasters'),
//   createGadiMasters: (data: any) => requests.post('/api/GadiMasters ', data)
// }

const api = {
    Village,
    Item,
    Unit,
    Account,
    //AccountBankDetail,
    //AccountTpes,
    //Bill,
    // BillDetail,
    // ItemSaleDetail,
    // GadiMasters
}

export default api;