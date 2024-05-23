import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit";
import { Village } from "../../app/models/villages";
import api from "../../app/api/api";
import { RootState } from "../../app/store/configureStore";

interface VillageState {
    village: Village | null,
    status: string;
    villageLoaded:boolean,
    currentPage:number,
    pageSize:number,
    totalItems:0,
    searchTerm: string,
    searchFilter:string,
    rowsPerPage:5,
    cities: string[],
    allVillages: Village[],
    selectedVillageId: number
}

const villagesAdapter = createEntityAdapter<Village>(); 

export const fetchVillagesAsync = createAsyncThunk<Village[], void,{state:RootState}>(
    'village/fetchVillagesAsync',
    async (_, {dispatch}) => {
        try {
             const response = await api.Village.getVillage();
             const data = response.data;
             //console.log('Response : ',response.data);
             return data;
        } catch (error: any) {
            return error;
        }
    }
)

//create village slice and add reducer functions 
export const villageSlice = createSlice({
    name: 'village',
    initialState: villagesAdapter.getInitialState<VillageState>({
        status: 'idle',
        villageLoaded: false,
        village: null,
        currentPage: 1,
        pageSize: 6,
        totalItems: 0,
        searchTerm: '',
        searchFilter: '',
        rowsPerPage: 5,
        cities: [],
        allVillages: [],
        selectedVillageId: 0
    }),
    reducers: {
        setPageNumber: (state, action) => {
            state.villageLoaded = false;
            state.currentPage = action.payload;
        },
        setTotalItems:(state, action)=>{
            state.totalItems = action.payload;
        },
        setSearchTerm:(state, action) => {
            state.searchTerm = action.payload;
        },
        setVillage: (state, action) => {
            villagesAdapter.upsertOne(state, action.payload);
            state.villageLoaded = false;
        },
        setFilter: (state, action) => {
            state.searchFilter = action.payload;
        },
        setRowsPerPage: (state, action) => {
            state.villageLoaded = false;
            state.rowsPerPage = action.payload;
        },
        removeVillage: (state, action) => {
            villagesAdapter.removeOne(state, action.payload);
            state.villageLoaded = false;
        },
        selectVillage: (state, action) => {
            const selectedName = action.payload;
            const selectedItem = state.allVillages.find((item) => item.villageName === selectedName);
            if (selectedItem) {
                state.selectedVillageId= selectedItem.id|| 0;
                console.log("id , villageName:", selectedName, state.selectedVillageId);
                
            } else {
                console.log("Item not found with name:", selectedName);
            }
        },
    },
    //add extra reducers to set state afer action
    extraReducers: (builder => {
        builder.addCase(fetchVillagesAsync.pending, (state, action) => {
            state.status = 'loading';
            state.villageLoaded = true;
        });
        builder.addCase(fetchVillagesAsync.fulfilled, (state, action) => {
            villagesAdapter.setAll(state, action.payload);
            state.cities = action.payload.map((item: Village) => item.villageName) ;
           // state.cities = action.payload.map((item: Village) => item.villageName).filter((villageName: string | null) => villageName !== null) as string[];
            state.allVillages = action.payload.map((item: Village) => item);
            state.status = 'idle';
            state.villageLoaded = false; 
        });
        builder.addCase(fetchVillagesAsync.rejected, (state, action) => {
            state.status = 'failed';
            state.villageLoaded = false;
        });
    })
})

export const villageSelectors = villagesAdapter.getSelectors((state:RootState) => state.village);
export const { setPageNumber,removeVillage, setVillage, setTotalItems, setSearchTerm, setFilter,setRowsPerPage, selectVillage} = villageSlice.actions;