import { Outlet } from "react-router-dom";
import Header from './Header';
import { Container, CssBaseline } from '@mui/material';
import ManageVillages from "../../features/village/ManageVillages";

function App() {
  //const [count, setCount] = useState(0)

  return (
    <>
    <Header/>
    <Container>
      <Outlet/>
      {/* <ManageVillages/> */}
    </Container>

    </>
  )
}

export default App
