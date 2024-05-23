import { createBrowserRouter, Navigate } from "react-router-dom";
import App from "../layout/App";
import HomePage from "../../features/home/HomePage";
import ManageUnit from "../../features/unit/ManageUnit";
import ManageItem from "../../features/item/ManageItem";
import ManageVillages from "../../features/village/ManageVillages";
import ManageAccount from "../../features/account/ManageAccount";
import ManageMandiBill from "../../features/mandiBill/ManageMandiBill";

// import ManageKharidiBill from "../../features/kharidiBill/ManageKharidiBill";
// import ManageExport from "../../features/export/ManageExport";

export const router = createBrowserRouter([
    {
        path: '/',
        element: <App />,
        children: [
                { path: '', element: <HomePage /> },
                { path: 'village', element: <ManageVillages /> },
                { path: 'item', element: <ManageItem /> },
                { path: 'unit', element: <ManageUnit /> },
                { path: 'account', element: <ManageAccount /> },
                { path: 'mandiBill', element: <ManageMandiBill /> },
                // { path: 'kharidiBill', element: <ManageKharidiBill /> },
                // {path:'export', element:<ManageExport/>},
                // { path: '*', element: <Navigate replace to='/not-found' /> }           
        ]
    }
])