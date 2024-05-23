import { useEffect, useState } from "react";
import { RootState, useAppDispatch, useAppSelector } from "../../app/store/configureStore";
import { accountSelectors, fetchAccountsAsync, removeAccount, setAccount, setFilter, setPageNumber } from "./accountSlice";
import { DataGrid, GridCellParams, GridColDef, GridToolbar } from "@mui/x-data-grid";
import { Box, Typography, Button, TextField, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle, Pagination, Grid } from "@mui/material";
import { Account } from "../../app/models/account";
import { fetchVillagesAsync } from "../village/villageSlice";
import { Edit, Delete, Search, Clear, Add } from "@mui/icons-material";
import { LoadingButton } from "@mui/lab";
import api from "../../app/api/api";
import AccountForm from "./AccountForm";

export default function ManageAccount() {
    const dispatch = useAppDispatch();

    const accounts = useAppSelector(accountSelectors.selectAll);
    const { accountLoaded, searchFilter, currentPage, rowsPerPage } = useAppSelector(state => state.account);

    //hooks for data, edit data  and pagination  
    const [editMode, setEditMode] = useState(false);
    const [selectedAccount, setSelectedAccount] = useState<Account | undefined>(undefined);
    const [loading, setLoading] = useState(false);
    const [isDeleteConfirmationOpen, setDeleteConfirmationOpen] = useState(false);
    const [accountToDelete, setAccountToDelete] = useState<Account | null>(null);
    const filters = useAppSelector((state: RootState) => state.account.searchFilter);

    const itemCount = Math.ceil(accounts.length / rowsPerPage);

    useEffect(() => {
        // fetchData()
        if (!accountLoaded) {
            dispatch(fetchAccountsAsync());
        }

    }, [accountLoaded, accounts, dispatch]);


    function handleSelectAccount(account: Account) {
        setSelectedAccount(account);
        setEditMode(true);
    }

    function cancelEdit() {
        if (selectedAccount) setSelectedAccount(undefined);
        setEditMode(false);
    }

    // delete record
    const handleDelete = (account: Account) => {
        setAccountToDelete(account);
        setDeleteConfirmationOpen(true);
    };

    const handleDeleteConfirmed = () => {
        if (accountToDelete) {
            setLoading(true);
            api.Account.deleteAccount(accountToDelete.id)
                .then(() => {
                    dispatch(removeAccount(accountToDelete.id));
                })
                .catch((error) => console.error('Error deleting data:', error))
                .finally(() => setLoading(false));
        }
        setDeleteConfirmationOpen(false);
    };

    const handleDeleteCanceled = () => {
        setDeleteConfirmationOpen(false);
    };

    //search record
    const handleSearch = (e: React.ChangeEvent<HTMLInputElement>) => {
        dispatch(setFilter(e.target.value));
        dispatch(setPageNumber(1));

    };

    const filteredData = accounts.filter((record) => {
        return Object.values(record).some((value) =>
            value.toString().toLowerCase().includes(searchFilter.toLowerCase())
        );
    });

    const onSearch = () => {
        dispatch(setAccount(filteredData));
    }

    const handleClearSearch = () => {
        dispatch(setFilter(''));
    };

    // Get current page
    const handlePageChange = async (event: any, newPage: number) => {
        dispatch(setPageNumber(newPage));
    };

    const columns: GridColDef[] = [
        {
            field: 'id',
            headerName: 'ID',
            type: 'number',
            width: 70,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "left", headerAlign: "left"
        },

        {
            field: 'accountCity',
            headerName: 'City Name',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountName',
            headerName: 'Account Name',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountNameHindi',
            headerName: 'Account Name (Hindi)',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountType',
            headerName: 'Account Type',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountFirmName',
            headerName: 'Firm Name',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountFirmName(Hindi)',
            headerName: 'Firm Name (Hindi)',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountSortName',
            headerName: 'Sort Name',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'emailId',
            headerName: 'Email Id',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountMobileNo',
            headerName: 'Mobile No.',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountAddress1',
            headerName: 'Address 1',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'accountAddress2',
            headerName: 'Address 2',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: 'License No',
            headerName: 'License No',
            width: 150,
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class',
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center"
        },
        {
            field: "Action",
            headerName: "Action",
            headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center", width: 250,
            renderCell: (params: GridCellParams) => {
                return (
                    <div>
                        <Button onClick={() => handleSelectAccount(params.row)} startIcon={<Edit />} />
                        <LoadingButton loading={loading} onClick={() => handleDelete(params.row)} startIcon={<Delete />} color='error' />
                    </div>
                )
            }
        },
    ];

    if (editMode) return <AccountForm account={selectedAccount} cancelEdit={cancelEdit} />

    return (
        <div>
            
            <Grid container alignItems="center" justifyContent="space-between">
                <Grid item>
                    <Box display="flex" alignItems="center" margin="10px">
                        <TextField
                            style={{ padding: 4, width: 150 }}
                            size="small"
                            label="Search Account"
                            variant="outlined"
                            value={filters}
                            onChange={handleSearch}
                        />
                        <Button onClick={onSearch} startIcon={<Search />} />
                        <Button onClick={handleClearSearch} startIcon={<Clear />} />
                    </Box>
                </Grid>
                <Grid item>
                    <Box display="flex" justifyContent="flex-end" margin="10px">
                        <Button onClick={() => setEditMode(true)} startIcon={<Add />}>
                            Create Account
                        </Button>
                    </Box>
                </Grid>
            </Grid>
            <DataGrid
                sx={{
                    '& .super-app-theme--header': {
                        backgroundColor: '#4c5667',
                    },
                    '& .bold-header': {
                        fontWeight: 'bold',
                        color: '#ffffff'
                    },
                }}
                columns={columns} rows={filteredData.length > 0 ? filteredData : accounts}
                slots={{ toolbar: GridToolbar }}
                pageSizeOptions={[5, 10, 25]}
                initialState={{
                    pagination: {
                        paginationModel: { pageSize: 5, page: 0 },
                    },
                }}
            />
            
            <Dialog open={isDeleteConfirmationOpen}
                onClose={handleDeleteCanceled}
                aria-labelledby="delete-confirmation-title"
                aria-describedby="delete-confirmation-description">
                <DialogTitle id="delete-confirmation-title">Confirm Delete</DialogTitle>
                <DialogContent>
                    <DialogContentText id="delete-confirmation-description">
                        Are you sure you want to delete the account "{accountToDelete?.accountName}"?
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleDeleteCanceled} color="primary">
                        Cancel
                    </Button>
                    <Button onClick={handleDeleteConfirmed} color="error" autoFocus>
                        Delete
                    </Button>
                </DialogActions>
            </Dialog>
      </div>
    )
}