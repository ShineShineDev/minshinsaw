<template>
    <div class="p-md-2">
        <div class="d-flex justify-content-between">
            <div>
                Company / All
            </div>
            <div style="float: right;" class="row w-75">
                <div class="col-md-4">
                    <input type="date" class="form-control ">
                </div>
                <div class="col-5 d-flex">
                    <input type="date" class="form-control "> &nbsp;
                    <button class="btn btn-sm border bg-white">Search</button>
                </div>
                <div class="col-3">
                    <div v-if="user?.role == 'admin'" class="d-flex">
                        <router-link to="/company/new">
                            <button class="btn bg-info btn-sm text-white">
                                Add New
                            </button>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <div class="bg-white p-2 rounded mt-3">
            <div v-if="postLoading" class="spinner-border text-primary" role="status">
                <span class="sr-only"></span>
            </div>
            <table class="table table-hover table-striped border">
                <thead>
                    <tr>
                        <td class="py-1 bg-info text-white">
                            No
                        </td>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Name</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Phone</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Email</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Logo</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Website</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Date</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">#</th>
                    </tr>
                </thead>
                <tbody v-if="fetchLoading">
                    <tr v-for="item in [1, 2, 3, 4, 5, 6]" :key="item">
                        <td colspan="8" class="bg-light animated-background pt-4"></td>
                    </tr>
                </tbody>
                <tbody>
                    <tr v-for="(item, index) in companies" :key="index">
                        <td class="py-1 px-2">{{ index + 1 }}</td>
                        <td class="py-1 px-2">{{ item.name }}</td>
                        <td class="py-1 px-2">{{ item.phone }}</td>
                        <td class="py-1 px-2">{{ item.email }}</td>
                        <td class="py-1 px-2">
                            <img :src="item.logo" style="height: 50px;width: 50px;border-radius:50px">
                        </td>
                        <td class="py-1 px-2">{{ item.website }}</td>
                        <td class="py-1 px-2">{{ item.created_at }}</td>
                        <td class="py-0 px-2">
                            <div v-if="user?.role == 'admin'" class="d-flex aling-item-center">
                                <button @click="editCompany(item.id)"
                                    class="d-inline btn btn-sm bg-light mt-3  ">Edit</button>
                                &nbsp;
                                <button @click="deleteCompany(item.id,index)"
                                    class="d-inline btn btn-sm bg-light mt-3 ">Delete</button>
                            </div>
                        </td>
                    </tr>
                    <tr v-if="companies.length < 1 && !fetchLoading">
                        <td colspan="7" class="text-center">No Record</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>

    import CompanyService from '@/services/CompanyService';
    import AuthService from '@/services/AuthService';
    import Router from 'vue-router';


    export default {
        name: "Company",
        data() {
            return {
                companies: [],
                fetchLoading: false,
                user: null,
                postLoading: false,
            };
        },
        components: {
        },
        methods: {
            async deleteCompany(id, index) {
                try {
                    this.postLoading = true;
                    await CompanyService.deleteResource(id);
                    this.companies.splice(index, 1);
                } catch (error) {
                    console.error('Error  :', error);
                } finally {
                    this.postLoading = false;
                }
            },
            async editCompany(id) {
                this.$router.push({
                    name: 'EditCompany',
                    params: { id: id },
                });
            },
        },
        async mounted() {
            try {
                this.fetchLoading = true;
                await CompanyService.get()
                this.companies = CompanyService.companies.reverse()
            } catch (error) {
                console.error('Error:', error);
            } finally {
                this.fetchLoading = false;
            }
            const currentProfile = JSON.parse(AuthService.getProfile());
            this.user = currentProfile
        },
    };
</script>

<style>
    @keyframes placeHolderShimmer {
        0% {
            background-position: -468px 0
        }

        100% {
            background-position: 468px 0
        }
    }

    .animated-background {
        animation-duration: 1.25s;
        animation-fill-mode: forwards;
        animation-iteration-count: infinite;
        animation-name: placeHolderShimmer;
        animation-timing-function: linear;
        background: #F6F6F6;
        background: linear-gradient(to right, #F6F6F6 8%, #F0F0F0 18%, #F6F6F6 33%);
        background-size: 800px 104px;
        position: relative;
    }

    .loader {
        width: 30px;
        height: 30px;
        border: 2px solid rgb(211, 84, 84);
        border-bottom-color: transparent;
        border-radius: 50%;
        display: inline-block;
        box-sizing: border-box;
        animation: rotation 1s linear infinite;
    }

    @keyframes rotation {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }

    @keyframes rotation {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }
</style>