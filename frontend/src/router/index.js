import { h, resolveComponent } from "vue";
import { createRouter, createWebHistory } from "vue-router";

import DefaultLayout from "@/layouts/DefaultLayout";
import AuthService from "@/services/AuthService";

const routes = [
    {
        path: "/",
        redirect: "/pages/login",
    },
    {
        path: "/",
        name: "Home",
        component: DefaultLayout,
        redirect: "/dashboard",
        children: [
            {
                path: "dashboard",
                name: "Dashboard",
                component: () => import("@/views/Dashboard.vue"),
                meta: { requiresAuth: true },
            },
            {
                path: "company",
                name: "company",
                component: () => import("@/views/pages/company/Company.vue"),
                meta: { requiresAuth: true },
            },
            {
                path: "company/new",
                name: "company/new",
                component: () => import("@/views/pages/company/New.vue"),
                meta: { requiresAuth: true },
            },
            {
                path: "company/edit/:id",
                name: "EditCompany",
                component: () => import("@/views/pages/company/Edit.vue"),
                meta: { requiresAuth: true },
            },

            {
                path: "employee",
                name: "employee",
                component: () => import("@/views/pages/employee/Employee.vue"),
                meta: { requiresAuth: true },
            },
            {
                path: "employee/new",
                name: "employee/new",
                component: () => import("@/views/pages/employee/New.vue"),
                meta: { requiresAuth: true },
            },
            {
                path: "employee/edit/:id",
                name: "EditEmployee",
                component: () => import("@/views/pages/employee/Edit.vue"),
                meta: { requiresAuth: true },
            },

            {
                path: "user",
                name: "user",
                component: () => import("@/views/pages/users/User.vue"),
                meta: { requiresAuth: true },
            },
            {
                path: "newuser",
                name: "newUser",
                component: () => import("@/views/pages/users/New.vue"),
                meta: { requiresAuth: true },
            },
            {
                path: "profile",
                name: "profile",
                component: () => import("@/views/pages/profile/Profile.vue"),
                meta: { requiresAuth: true },
            },
            {
                path: "/icons",
                name: "Icons",
                component: () => import("@/views/icons/CoreUIIcons.vue"),
                meta: { requiresAuth: true },
            },
        ],
    },
    {
        path: "/pages",
        redirect: "/pages/404",
        name: "Pages",
        component: {
            render() {
                return h(resolveComponent("router-view"));
            },
        },
        children: [
            {
                path: "404",
                name: "Page404",
                component: () => import("@/views/pages/Page404"),
            },
            {
                path: "500",
                name: "Page500",
                component: () => import("@/views/pages/Page500"),
            },
            {
                path: "login",
                name: "Login",
                component: () => import("@/views/pages/Login"),
                meta: { requiresAuth: false },
            },
            {
                path: "register",
                name: "Register",
                component: () => import("@/views/pages/Register"),
                meta: { requiresAuth: false },
            },
        ],
    },
];

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
    scrollBehavior() {
        return { top: 0 };
    },
});

router.beforeEach((to, from, next) => {
    if (to.meta.requiresAuth) {
        if (AuthService.isAuthenticated()) {
            next();
        } else {
            next({ name: "Login" });
        }
    } else {
        if (to.name == "Login" && AuthService.isAuthenticated()) {
            next({ name: "Dashboard" });
        } else if (to.name == "Register" && AuthService.isAuthenticated()) {
            next({ name: "Dashboard" });
        } else {
            next();
        }
    }
});

export default router;
