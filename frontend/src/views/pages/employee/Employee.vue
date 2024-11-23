<template>
    <div class="p-md-2">

       

        <div class="d-flex justify-content-between">
            <div>
                Employee / All
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
                    <div v-if="user?.role == 'admin'" style="float: right;" class="d-flex">
                        <router-link to="/employee/new">
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
                        <td class="py-1 bg-info text-white">No</td>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Name</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Email</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Phone</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Profile Picture
                        </th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Company</th>
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
                    <tr v-for="(item, index) in employees" :key="index"
                        :class="{ 'selected-row': index === selectedRowIndex }">
                        <td class="py-1 px-2">{{ index + 1 }}</td>
                        <td class="py-1 px-2">{{ item.name }}</td>
                        <td class="py-1 px-2">{{ item.email }}</td>
                        <td class="py-1 px-2">{{ item.phone }}</td>
                        <td class="py-1 px-2">
                            <img :src="item.profile" style="height: 50px;" class="img-fluild">
                        </td>
                        <td class="py-1 px-2">{{ item.company?.name }}</td>
                        <td class="py-1 px-2">{{ item.created_at }}</td>
                        <td class="py-1 px-2">
                            <div v-if="user?.role == 'admin'" class="d-flex aling-item-center">
                                <button @click="editEmployee(item.id)" class="d-inline btn btn-sm bg-light mt-3  ">Edit</button>
                                &nbsp;
                                <button @click="deleteEmployee(item.id,index)"
                                    class="d-inline btn btn-sm bg-light mt-3 ">Delete</button>
                            </div>
                        </td>
                    </tr>
                    <tr  v-if="employees.length < 1 && !fetchLoading" >
                        <td colspan="7" class="text-center">No Record</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>

    import Employee from '@/services/Employee';
    import CompanyService from '@/services/CompanyService';
    import AuthService from '@/services/AuthService';


    export default {
        name: "Employee",
        data() {
            return {
                employees: [],
                fetchLoading: false,
                user: null,
                postLoading : false
            };
        },
        methods: {
            async deleteEmployee(id, index) {
                try {
                    this.postLoading = true;
                    await Employee.deleteResource(id);
                    this.employees.splice(index, 1);
                } catch (error) {
                    console.error('Error  :', error);
                } finally {
                    this.postLoading = false;
                }
            },
            async editEmployee(id) {
                this.$router.push({
                    name: 'EditEmployee',
                    params: { id: id },
                });
            },
        },
        async mounted() {
            try {
                this.fetchLoading = true;
                await Employee.fetchAll()
                this.employees = Employee.employees.reverse()
            } catch (error) {
                console.error('Error fetching Employee:', error);
            } finally {
                this.fetchLoading = false;
            }
            const currentProfile = JSON.parse(AuthService.getProfile());
            this.user = currentProfile;
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