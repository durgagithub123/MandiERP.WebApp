import { Box, Typography, Grid, Button, TextField, Container, Alert, AlertTitle, Snackbar, } from "@mui/material";
import { LoadingButton } from "@mui/lab";
import AppTextInput from "../../app/components/AppTextInput";
import { Village } from "../../app/models/villages";
import { FieldValues, useForm } from "react-hook-form";
import { useState, useEffect } from "react";
import axios from "axios";
import { useAppDispatch } from "../../app/store/configureStore";
import { setVillage } from "./villageSlice";
import api from "../../app/api/api";

interface Props {
  village?: Village;
  cancelEdit: () => void;
}

export default function VillageForm({ village, cancelEdit }: Props) {
  const dispatch = useAppDispatch();
  const { control, reset, handleSubmit, watch, formState: { isSubmitting }, } = useForm();
  const [openAlert, setOpenAlert] = useState(false);

  useEffect(() => {
    if (village) {
      reset(village);
    }
  }, [village, reset]);

  async function onSubmit(data: FieldValues) {
    try {
        let response: Village;
        if (village) {
            response = await api.Village.updateVillage(village.id,data);
            console.log("onSubmit res: ", response);
        } else {
            response = await api.Village.createVillage(data);
            console.log("onSubmit res: ", response);
        }
        //dispatch(setItem(response));
        dispatch(setVillage(response));;
        setOpenAlert(true);
        setTimeout(function () {
            window.location.reload();
        }, 2000);
    } catch (error) {
        console.log(error);
    }
}

  return (
    <>
      <Container maxWidth="sm">
        <Typography variant="h4">Village Details</Typography>
        <form onSubmit={handleSubmit(onSubmit)} style={{ margin: 10, padding: 10 }}>
          <Grid container spacing={2}>
            <Box mb={2}>
              <AppTextInput control={control} label="Village name" name="villageName" required={false} defaultValue='' />
            </Box>
            <Box>
              <AppTextInput control={control}
                label="Village name (Hindi)"
                name="villageNameHindi"
                required={false} defaultValue=''
              />
            </Box>
            <Box
              display="flex"
              justifyContent="flex-end"
              sx={{ mt: 3, p: 1 }}
            >
              <Button variant="contained" color="inherit" onClick={cancelEdit} sx={{ marginRight: 2 }}>
                Cancel
              </Button>
              <LoadingButton loading={isSubmitting} type='submit' variant='contained' color='success'>Submit</LoadingButton>
            </Box>

            {/* ============= Alert Show karega ============= */}
            <Snackbar
              anchorOrigin={{
                vertical: 'top',
                horizontal: 'center',
              }}
              open={openAlert}
              autoHideDuration={3000} // Adjust the duration as needed
              onClose={() => setOpenAlert(false)}
              message="Form submitted successfully."
            />
            {/* =========================================== */}
          </Grid>
        </form>
      </Container>
    </>
  );
}
