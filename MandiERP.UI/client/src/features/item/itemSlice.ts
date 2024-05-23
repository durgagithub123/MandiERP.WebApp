import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit";
import api from "../../app/api/api";
import { RootState } from "../../app/store/configureStore";
import { Item } from "../../app/models/item";

interface ItemState{
    item: Item | null,
    status: string,
    itemLoaded: boolean,
    currentPage:number,
    pageSize:number,
    totalItems:0,
    searchTerm:string,
    searchFilter:string,
    rowsPerPage:5,
    //cities:string[],
    itemList: string[],
    allItems:Item[],
    selectedItemId: number

    //used in billDetails and itemSaleDetails
    percentComission: number
}

const itemsAdapter=createEntityAdapter<Item>();

export const fetchItemsAsync = createAsyncThunk<Item[], void,{state:RootState}>(
    'item/fetchItemesAsync',
    async (_, {dispatch}) => {
        try {
             const response = await api.Item.getItem();
             const data = response.data;
            // console.log('Data :',data)          
            return data;
        } catch (error: any) {
            return error;
        }
    }
)
export const itemSlice = createSlice({
    name: 'item',
    initialState:itemsAdapter.getInitialState<ItemState>({
        status: 'idle',
        itemLoaded: false,
        item: null,
        currentPage: 1,
        pageSize: 6,
        totalItems: 0,
        searchTerm: '',
        searchFilter: '',
        rowsPerPage: 5,
        //cities: [],
        itemList: [],
        allItems: [],
        selectedItemId: 0,

        //used in billDetails and itemSaleDetails
        percentComission: 0
    }),
    reducers: {
        setPageNumber: (state, action) => {
            state.itemLoaded = false;
            state.currentPage = action.payload;
        },
        setTotalItems:(state, action)=>{
            state.totalItems = action.payload;
        },
        setSearchTerm:(state, action) => {
            state.searchTerm = action.payload;
        },
        setItem: (state, action) => {
            itemsAdapter.upsertOne(state, action.payload);
            state.itemLoaded = false;
        },
        setFilter: (state, action) => {
            state.searchFilter = action.payload;
        },
        setRowsPerPage: (state, action) => {
            state.itemLoaded = false;
            state.rowsPerPage = action.payload;
        },
        removeItem: (state, action) => {
            itemsAdapter.removeOne(state, action.payload);
            state.itemLoaded = false;
        },
        selectItem: (state, action) => {
            const selectedName = action.payload;
            const selectedItem = state.allItems.find((item) => item.itemName === selectedName);
            if (selectedItem) {
                state.selectedItemId= selectedItem.id|| 0;
            } else {
                console.log("Item not found with name:", selectedName);
            }
        },
    },

    //add extra reducers to set state afer action
    extraReducers: (builder => {
        builder.addCase(fetchItemsAsync.pending, (state, action) => {
            state.status = 'loading';
            state.itemLoaded = true;
        });
          builder.addCase(fetchItemsAsync.fulfilled, (state, action) => {
            itemsAdapter.setAll(state, action.payload);
            state.itemList = action.payload.map((item: Item) => item.itemName);
            state.allItems = action.payload.map((item: Item) => item);
            state.status = 'idle';
            state.itemLoaded = false;
            
        });
        builder.addCase(fetchItemsAsync.rejected, (state, action) => {
            state.status = 'failed';
            state.itemLoaded = false;
        });
    })
})
export const itemSelectors = itemsAdapter.getSelectors((state:RootState) => state.item);
export const { setPageNumber, removeItem, setItem, setTotalItems,setSearchTerm, setFilter, setRowsPerPage, selectItem } = itemSlice.actions;