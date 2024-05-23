import { DataGrid, GridCellParams, GridColDef, GridToolbar } from "@mui/x-data-grid";
import { Grid, Box, Button, Dialog , DialogActions, DialogContent, DialogContentText, DialogTitle, TextField } from "@mui/material";
import { useState, useEffect, } from 'react';
import { Village } from '../../app/models/villages';
import { Add, Clear, Delete, Edit, Search } from "@mui/icons-material";
import VillageForm from "./VillageForm";
import { fetchVillagesAsync, removeVillage, setFilter, setPageNumber, villageSelectors } from "./villageSlice";
import { RootState, useAppDispatch, useAppSelector } from "../../app/store/configureStore";
import api from "../../app/api/api";
import { gadiMastersSelectors } from "../mandiBill/billSlice";
import axios from "axios";
import { GadiMasters } from "../../app/models/gadiMasters";

export default function ManageVillage(){

  //const [villages, setVillages] = useState<Village[]>([]);
  const [gadimaster,setGadiMaster] = useState<GadiMasters[]>([]);
  
  //const [villages, setVillages] = useState([]);
  //const [villages, setVillages] = useState<Village[]>([]);
  const dispatch = useAppDispatch();
  const villages = useAppSelector(villageSelectors.selectAll);

  const gadiMaster = useAppSelector(gadiMastersSelectors.selectAll);

  const { villageLoaded } = useAppSelector(state => state.village);
  const [editMode, setEditMode] = useState(false);
  const [isDeleteConfirmationOpen, setDeleteConfirmationOpen] = useState(false);
  const [villageToDelete, setVillageToDelete] = useState<Village | null>(null);
  const [selectedVillage, setSelectedVillage] = useState<Village | undefined>(undefined);
  const [loading, setLoading] = useState(false);
  const [filteredData, setFilteredData] = useState<Village[]>([]);
  const filters = useAppSelector((state: RootState) => state.village.searchFilter);

  //This is for getting data ditect using API URL 
  // useEffect(() => {
  //   const fetchData = async () => {
  //     try {
  //       const response = await axios.get('https://localhost:44361/api/Village/GetAllVillages/');
  //       setVillages(response.data.readVillageData);
  //       console.log("data:", response.data.readVillageData);
  //     } catch (error) {
  //       console.error('Error fetching data:', error);
  //     }
  //   };

  //   fetchData();
  // }, []); // Empty dependency array ensures the effect runs only once

  //This is for getting data ditect using API URL 

  // useEffect(() => {
  //   const fetchData = async () => {
  //     try {
  //       const response = await axios.get('https://localhost:5000/api/GadiMasters');
  //       setGadiMaster(response.data);
  //       console.log("gadiMasterData :", response.data);
  //     } catch (error) {
  //       console.error('Error fetching data:', error);
  //     }
  //   };

  //   fetchData();
  // }, []); // Empty dependency array ensures the effect runs only once

  useEffect(() => {
    if (!villageLoaded) {
      dispatch(fetchVillagesAsync());
    }
  }, [villages, dispatch, villageLoaded]);
  //console.log('All Villages :',villages)

  function handleSelectVillage(village: Village) {
    setSelectedVillage(village);
    setEditMode(true);
  }

  function cancelEdit() {
    if (selectedVillage) setSelectedVillage(undefined);
    setEditMode(false);
  }
  const handleDelete = (village: Village) => {
    setVillageToDelete(village);
    setDeleteConfirmationOpen(true);
  };
  const handleDeleteConfirmed = () => {
    if (villageToDelete) {
      setLoading(true);
       api.Village.deleteVillage(villageToDelete.id)
        .then(() => {
          dispatch(removeVillage(villageToDelete.id));
        })
        .catch((error) => console.error("Error deleting data:", error))
        .finally(() => setLoading(false));
    }
    setDeleteConfirmationOpen(false);
  };

  const handleDeleteCanceled = () => {
    setDeleteConfirmationOpen(false);
  };

  const columns: GridColDef[] = [
    { 
      field: "id",
      headerName: "ID",
      type: "number", 
      headerClassName: 'super-app-theme--header bold-header custom-header-class' ,
      cellClassName: 'super-app-theme--cell', align: "left", headerAlign: "left", width: 100 },
    {
      field: "villageName",
      headerName: "Village Name",
      type: "string",
      editable: true,
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', width: 400
    },
    {
      field: "villageNameHindi",
      headerName: "Village Name In Hindi",
      editable: true,
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', width: 400
    },
    {
      field: "Action",
      headerName: "Action",
      headerClassName: 'super-app-theme--header bold-header', cellClassName: 'super-app-theme--cell', align: "center", headerAlign: "center", width: 250,
      renderCell: (params: GridCellParams) => {
        return (
          <div>
            <Button
              onClick={() => handleSelectVillage(params.row)}
              startIcon={<Edit />}
            />
            <Button
              onClick={() => handleDelete(params.row)}
              startIcon={<Delete />}
              color="error"
            />
          </div>
        );
      },
    },
  ];

  //================= Search record ===========================
  const handleSearch = (e: React.ChangeEvent<HTMLInputElement>) => {
    const searchTerm = e.target.value.toLowerCase();
    dispatch(setFilter(e.target.value));

    const dataToFilter = villageLoaded ? villages : [];

    // Use filter to get the filtered results
    const filteredResults = dataToFilter.filter((record) =>
      Object.values(record).some((value) =>
      value !== null && value.toString().toLowerCase().includes(searchTerm)
      )
    );
    
    // Update the filteredData state
    setFilteredData(filteredResults);
    dispatch(setPageNumber(1));
  };
  const onSearch = () => {
    dispatch(fetchVillagesAsync());
  };
  const handleClearSearch = () => {
    dispatch(setFilter(''));

    setPageNumber(1);
    setFilteredData([]); // Clear filteredData when clearing search
    // setVillages(villages);
  }
  //==========================================================================

  //============== call VillageForm component for edit or create record ================
  if (editMode)
    return <VillageForm village={selectedVillage} cancelEdit={cancelEdit} />;
  //============================================================================

  return (
    <div>
      {/* <h1>Villages</h1> */}
      <Grid container alignItems="center" justifyContent="space-between">
        <Grid item>
          <Box display="flex" alignItems="center" margin="10px">
            <TextField
              style={{ padding: 4, width: 150 }}
              size="small"
              label="Search Village"
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
              Create Village
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
        columns={columns} rows={filteredData.length > 0 ? filteredData : villages}
        slots={{ toolbar: GridToolbar }}
        pageSizeOptions={[5, 10, 25]}
        initialState={{
          pagination: {
            paginationModel: { pageSize: 5, page: 0 },
          },
        }}
      />

      <Dialog
        open={isDeleteConfirmationOpen}
        onClose={handleDeleteCanceled}
        aria-labelledby="delete-confirmation-title"
        aria-describedby="delete-confirmation-description"
      >
        <DialogTitle id="delete-confirmation-title">Confirm Delete</DialogTitle>
        <DialogContent>
          <DialogContentText id="delete-confirmation-description">
            Are you sure you want to delete the village "{villageToDelete?.villageName}
            "?
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
