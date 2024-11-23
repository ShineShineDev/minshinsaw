export default [
    {
        component: "CNavItem",
        name: "Dashboard",
        to: "/dashboard",
        icon: "cil-speedometer",
        badge: {
            color: "primary",
            
        },
        only : ['admin','manager','user']
    },
    {
        component: "CNavItem",
        name: "Companies",
        to: "/company",
        icon: "cil-user",
        badge: {
            color: "primary",
            
        },
        only : ['admin']
    },
    {
        component: "CNavItem",
        name: "Employees",
        to: "/employee",
        icon: "cil-user",
        badge: {
            color: "primary",
            
        },
        only : ['admin','manager']
    },  
    {
        component: "CNavItem",
        name: "Users",
        to: "/user",
        icon: "cil-user",
        badge: {
            color: "primary",
            
        },
        only : ['admin']
    },  
    {
        component: "CNavItem",
        name: "Profile",
        to: "/profile",
        icon: "cil-user",
        badge: {
            color: "primary",
            
        },
        only : ['admin','manager','user']
    },  
];
