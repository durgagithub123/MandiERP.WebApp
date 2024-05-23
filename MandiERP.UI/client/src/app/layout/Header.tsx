import { AppBar, List, ListItem, Toolbar, Typography } from "@mui/material";
import { NavLink } from "react-router-dom";

const midLinks = [
    { title: 'Village', path: '/village' },
    { title: 'Item', path: '/item' },
    { title: 'Unit', path: '/unit' },
    { title: 'Account', path: '/account' },
    { title: 'MandiBill', path: '/mandiBill' },
//     { title: 'KharidiBill', path: '/kharidiBill' },
//     { title: 'Export', path: '/export' }
 ]

 const navStyles = {
    color: 'inherit',
    textDecoration: 'none',
    typography: 'h6',
    '&:hover': {
        color: 'grey.500'
    },
    '&.active': {
        color: 'text.secondary'
    }
}

// const appBarStyles = {
//     mb: 2,
//     backgroundColor: '#242424', // Replace with your desired background color
//   };


export default function Header() {
return (
    <AppBar position='static' sx={{mb: 2,}}>
        <Toolbar>
            <Typography variant="h6" component={NavLink}
                        to='/'
                        sx={navStyles}>
                HOME
            </Typography>
            <List sx={{ display: 'flex' }}>
                    {midLinks.map(({ title, path }) => (
                        <ListItem
                            component={NavLink}
                            to={path}
                            key={path}
                            sx={navStyles}
                        >
                            {title}
                        </ListItem>
                    ))}

                </List>
        </Toolbar>
    </AppBar>
)
}