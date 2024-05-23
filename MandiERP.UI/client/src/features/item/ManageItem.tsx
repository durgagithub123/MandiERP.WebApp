import { fetchItemsAsync, itemSelectors, removeItem, setFilter, setItem, setPageNumber } from "./itemSlice";
import { Grid, Box, Button, Dialog , DialogActions, DialogContent, DialogContentText, DialogTitle, TextField } from "@mui/material";
import { RootState, useAppDispatch, useAppSelector } from "../../app/store/configureStore";
import { DataGrid, GridCellParams, GridColDef, GridToolbar } from "@mui/x-data-grid";
import { Edit, Delete, Search, Clear, Add } from "@mui/icons-material";
import { useEffect, useState } from "react";
import { Item } from "../../app/models/item";
import api from "../../app/api/api";
import ItemForm from "./ItemForm";

export default function ManageItem() {

  const dispatch = useAppDispatch();
  //const [items, setItems] = useState<Item[]>([]);
  const items = useAppSelector(itemSelectors.selectAll);

  const [selectedItem, setSelectedItem] = useState<Item | undefined>(undefined);
  const [editMode, setEditMode] = useState(false)
  const [isDeleteConfirmationOpen, setDeleteConfirmationOpen] = useState(false);
  const [itemToDelete, setItemToDelete] = useState<Item | null>(null);
  const [loading, setLoading] = useState(false);
  const [filteredData, setFilteredData] = useState<Item[]>([]);
  const { itemLoaded } = useAppSelector(state => state.item);
  const filters = useAppSelector((state: RootState) => state.item.searchFilter);


 // ============= This is for getting data ditect using API URL ========== 
  // useEffect(() => {
  //   const fetchData = async () => {
  //     try {
  //       const response = await axios.get('https://localhost:5000/api/ItemTypes');
  //       setItems(response.data);
  //       console.log("data:", response.data);
  //     } catch (error) {
  //       console.error('Error fetching data:', error);
  //     }
  //   };

  //   fetchData();
  // }, []); // Empty dependency array ensures the effect runs only once

  useEffect(() => {
    if (!itemLoaded) {
      dispatch(fetchItemsAsync());
    }
  }, [itemLoaded, dispatch]);

  function handleSelectItem(item: Item) {
    setSelectedItem(item);
    setEditMode(true);
  }
  function cancelEdit() {
    if (selectedItem) setSelectedItem(undefined);
    setEditMode(false);
  }

  const handleDelete = (item: Item) => {
    setItemToDelete(item);
    setDeleteConfirmationOpen(true);
};

  const handleDeleteConfirmed = () => {
    if (itemToDelete) {
      setLoading(true);
      api.Item.deleteItem(itemToDelete.id)
        .then(() => {
          dispatch(removeItem(itemToDelete.id));
        })
        .catch((error) => console.error('Error deleting data:', error))
        .finally(() => setLoading(false));
    }
    setDeleteConfirmationOpen(false);
  };
  const handleDeleteCanceled = () => {
    setDeleteConfirmationOpen(false);
  };

  //================= Methods for Search Records Start ===========================
  const handleSearch = (e: React.ChangeEvent<HTMLInputElement>) => {
    const searchTerm = e.target.value.toLowerCase();
    console.log('searchTerm:',searchTerm)
    dispatch(setFilter(e.target.value));

    const dataToFilter = itemLoaded ? items : [];
    console.log('dataToFilter:',dataToFilter)

    const filteredResults = dataToFilter.filter((record) =>
    Object.values(record).some((value) =>
      value !== null && value.toString().toLowerCase().includes(searchTerm)
    )
  );

    // Update the filteredData state
    setFilteredData(filteredResults);
    console.log(filteredResults)
    dispatch(setPageNumber(1));
  };
  const onSearch = () => {
    dispatch(fetchItemsAsync());
  };
  const handleClearSearch = () => {
    dispatch(setFilter(''));

    setPageNumber(1);
    setFilteredData([]); // Clear filteredData when clearing search
    // setVillages(villages);
  }
  //============================== Methods for Search Records End ============================================

  //============== call ItemForm component for edit or create record ================
  if (editMode) return <ItemForm item={selectedItem} cancelEdit={cancelEdit} />
  //====================================================================================
  const columns: GridColDef[] = [
    { 
      field: 'id', 
      headerName: 'ID', 
      type: 'number', 
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', 
      width: 70,
      headerAlign: "left",
      align: "left"
    },
    { 
      field: 'itemName', 
      headerName: 'Item Name', 
      type: 'string',
      editable: true,
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', 
      width: 215,       
      headerAlign: "center",
      align: "center", 
    },
    { 
      field: 'itemNameHindi', 
      headerName: 'Item Name (Hindi)', 
      type: 'string',
      editable: true,
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', 
      width: 215,       
      headerAlign: "center",
      align: "center",
    },
    { 
      field: 'rateOfUnitinKgs', 
      headerName: 'Rate of Unit (kg)', 
      type: 'number', 
      editable: true,
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', 
      width: 200,       
      headerAlign: "center",
      align: "center",
    },
    { 
      field: 'percentComission', 
      headerName: 'Commission (%)', 
      type: 'number', 
      editable: true,
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', 
      width: 200,       
      headerAlign: "center",
      align: "center",
    },
    {
      field: "Action",
      headerName: "Action",
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center",
      width: 250,

      renderCell: (params: GridCellParams) => {
        return (
          <div>
            <Button onClick={() => handleSelectItem(params.row)} startIcon={<Edit />} />
            <Button onClick={() => handleDelete(params.row)} startIcon={<Delete />} color='error' />
          </div>
        )
      }
    },
  ];

  return (
    <div>
      {/* <h1>Manage Item</h1>  */}
      <Grid container alignItems="center" justifyContent="space-between">
        <Grid item>
          <Box display="flex" alignItems="center" margin="10px">
            <TextField
              style={{ padding: 4, width: 150 }}
              size="small"
              label="Search Items"
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
              Create Item
            </Button>
          </Box>
        </Grid>
      </Grid>

      <Grid container alignItems="center" justifyContent="space-between">
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
          // columns={columns} rows={items}
          // slots={{ toolbar: GridToolbar }}
          // pageSizeOptions={[5, 10, 25]}
          // initialState={{
          //   pagination: {
          //     paginationModel: { pageSize: 5, page: 0 },
          //   },
          // }}
          columns={columns} rows={filteredData.length > 0 ? filteredData : items}
          slots={{ toolbar: GridToolbar }}
          pageSizeOptions={[5, 10, 25]}
          initialState={{
            pagination: {
              paginationModel: { pageSize: 5, page: 0 },
            },
          }}
        />
      </Grid>

      <Dialog open={isDeleteConfirmationOpen}
        onClose={handleDeleteCanceled}
        aria-labelledby="delete-confirmation-title"
        aria-describedby="delete-confirmation-description">
        <DialogTitle id="delete-confirmation-title">Confirm Delete</DialogTitle>
        <DialogContent>
          <DialogContentText id="delete-confirmation-description">
            Are you sure you want to delete the item "{itemToDelete?.itemName}"?
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
  );
}