import { useEffect, useState } from "react"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore";
import { fetchUnitsAsync, removeUnit, setFilter, setPageNumber, setUnit, unitSelectors } from "./unitSlice";
import { DataGrid, GridCellParams, GridColDef, GridToolbar } from "@mui/x-data-grid";
// import { Box, Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle, Pagination, TextField, Toolbar, Typography } from "@mui/material";
import { Grid, Box, Button, Dialog , DialogActions, DialogContent, DialogContentText, DialogTitle, TextField } from "@mui/material";
import api from "../../app/api/api";
import { LoadingButton } from "@mui/lab";
import { Add, Clear, Delete, Edit, Search } from "@mui/icons-material";
import { Unit } from "../../app/models/unit";
import UnitForm from "./UnitForm";

export default function ManageUnit() {
    const dispatch = useAppDispatch();
    const units = useAppSelector(unitSelectors.selectAll);
    const { unitLoaded } = useAppSelector(state => state.unit);
    const filters = useAppSelector(state => state.unit.searchFilter);
    const { currentPage, rowsPerPage } = useAppSelector(state => state.unit);

    //hooks for data, edit data  and pagination  
    const [editMode, setEditMode] = useState(false);
    const [selectedUnit, setSelectedUnit] = useState<Unit| undefined>(undefined);
    const [loading, setLoading] = useState(false);
    const [isDeleteConfirmationOpen, setDeleteConfirmationOpen] = useState(false);
    const [unitToDelete, setUnitToDelete] = useState<Unit | null>(null);

    const itemCount = Math.ceil(units.length / rowsPerPage);

    useEffect(() => {
        if (!unitLoaded) {
            dispatch(fetchUnitsAsync());
        }
    }, [unitLoaded, units, dispatch]);

    function handleSelectUnit(unit: Unit) {
        setSelectedUnit(unit);
        setEditMode(true);
    }

    function cancelEdit() {
        if (selectedUnit) setSelectedUnit(undefined);
        setEditMode(false);
    }

    // delete record
    const handleDelete = (unit: Unit) => {
        setUnitToDelete(unit);
        setDeleteConfirmationOpen(true);
    };

    const handleDeleteConfirmed = () => {
        if (unitToDelete) {
            setLoading(true);
            api.Unit.deleteUnit(unitToDelete.id)
                .then(() => {
                    dispatch(removeUnit(unitToDelete.id));
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

    const filteredData = units.filter((record) => {
        return Object.values(record).some((value) =>
            value.toString().toLowerCase().includes(filters.toLowerCase())
        );
    });
    
    const onSearch = () => {
        dispatch(setUnit(filteredData));
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
            type:'number', 
            headerClassName: 'super-app-theme--header bold-header custom-header-class' ,
            cellClassName: 'super-app-theme--cell', align: "left", headerAlign: "left", width: 70,
        },
        { 
            field: 'itemUnit', 
            headerName: 'Unit Name', 
            type:'string', 
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class' ,
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center", width: 100,

        },
        { 
            field: 'itemUnitHindi', 
            headerName: 'Unit Name (Hindi)', 
            editable: true,
            headerClassName: 'super-app-theme--header bold-header custom-header-class' ,
            cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center", width: 100,
        },
        { 
            field: 'weightCuttingPerUnit', 
            headerName: 'Weight Cutting/Unit',
            type:'number', 
            headerClassName: 'super-app-theme--header bold-header custom-header-class' ,
            cellClassName: 'super-app-theme--cell', align: "left", headerAlign: "left", width: 150,
            editable: true 
        },
        { 
            field: 'hammaliPerUnit', 
            headerName: 'Hammali/Unit',
            type:'number', 
            headerClassName: 'super-app-theme--header bold-header custom-header-class' ,
            cellClassName: 'super-app-theme--cell', align: "left", headerAlign: "left", width: 150,
            editable: true 
        },
        { 
            field: 'tulaiPerUnit', 
            headerName: 'Tulai/Unit',
            type:'number', 
            headerClassName: 'super-app-theme--header bold-header custom-header-class' ,
            cellClassName: 'super-app-theme--cell', align: "left", headerAlign: "left", width: 150,
            editable: true 
        },
        { 
            field: 'khadiKariPerUnit', 
            headerName: 'KhadiKari/Unit',
            type:'number', 
            headerClassName: 'super-app-theme--header bold-header custom-header-class' ,
            cellClassName: 'super-app-theme--cell', align: "left", headerAlign: "left", width: 150,
            editable: true 
        },
        { 
            field: "Action",
            headerName: "Action",
            headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center", width: 250,

            renderCell:(params:GridCellParams) => {
                return(
                    <div>
                    <Button onClick={() => handleSelectUnit(params.row)} startIcon={<Edit />} />
                    <LoadingButton loading={loading} onClick={() => handleDelete(params.row)} startIcon={<Delete />} color='error' />
                    </div>
                )
            }
        },
    ];

    if (editMode) return <UnitForm unit={selectedUnit} cancelEdit={cancelEdit} />

    return (
        <div>
        {/* <Box>
            <Typography variant="h4">Unit</Typography>
            <Button onClick={() => setEditMode(true)}>Create</Button>
        </Box>
        <TextField
                label="Search Unit"
                variant="outlined"
                value={filters}
                onChange={handleSearch}
        />
        <Button onClick={onSearch}>Search Unit</Button>
        <Button onClick={handleClearSearch}>Clear Search</Button> */}
        <Grid container alignItems="center" justifyContent="space-between">
        <Grid item>
          <Box display="flex" alignItems="center" margin="10px">
            <TextField
              style={{ padding: 4, width: 150 }}
              size="small"
              label="Search Unit"
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
              Create Unit
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
        columns={columns} rows={filteredData.length > 0 ? filteredData : units}
        slots={{ toolbar: GridToolbar }}
        pageSizeOptions={[5, 10, 25]}
        initialState={{
          pagination: {
            paginationModel: { pageSize: 5, page: 0 },
          },
        }}
      />

        {/* <DataGrid editMode="row" rows={filteredData.slice((currentPage - 1) * rowsPerPage, currentPage * rowsPerPage)} columns={columns} 
        // components={{Toolbar: () => (<div><GridToolbar /></div> ),}}
        
        pagination components={{Pagination: () => (<Pagination count={itemCount} page={currentPage} onChange={handlePageChange} color="secondary" defaultPage={currentPage}/>)}}
        /> */}
        <Dialog open={isDeleteConfirmationOpen}
                onClose={handleDeleteCanceled}
                aria-labelledby="delete-confirmation-title"
                aria-describedby="delete-confirmation-description">
                <DialogTitle id="delete-confirmation-title">Confirm Delete</DialogTitle>
                <DialogContent>
                    <DialogContentText id="delete-confirmation-description">
                        Are you sure you want to delete the unit "{unitToDelete?.id}"?
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