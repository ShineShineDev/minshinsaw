<template>
    <div class="p-md-2">
        <div>
            User / Create New
            <router-link to="/company">
                <button class="btn bg-info btn-sm text-white" style="float: right;">
                    <i class="bi bi-x-circle-fill"></i>
                </button>
            </router-link>
        </div>
        <div class="bg-white p-2 rounded mt-3 px-md-5 p-2 py-3">
            <form @submit.prevent="submitForm" enctype="multipart/form-data">

                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="name">Name:</label>
                    <div class="col-sm-6">
                        <input v-model="name" class="form-control form-control-sm" id="name" type="text" />
                    </div>
                </div>

                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="email">Email:</label>
                    <div class="col-sm-6">
                        <input v-model="email" class="form-control form-control-sm" id="email" type="email" />
                    </div>
                </div>

                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="phone">Password</label>
                    <div class="col-sm-6">
                        <input v-model="password" class="form-control form-control-sm" id="password" type="text" />
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="phone">Role</label>
                    <div class="col-sm-6">
                        <select class="form-control-select w-100 form-control-sm" v-model="role">
                            <option value="admin">admin</option>
                            <option value="manager">manager</option>
                            <option value="user">user</option>
                        </select>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6">
                        <button v-if="!postLoading" type="submit" :disabled="isSubmitDisabled"
                            class="btn btn-sm btn-primary">
                            <i v-if="isSubmitDisabled" class="bi bi-x"></i>
                            <i v-if="!isSubmitDisabled" class="bi bi-check"></i> Submit
                        </button>
                        <div v-if="postLoading" class="spinner-border text-primary" role="status">
                            <span class="sr-only"></span>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    import AuthService from "@/services/AuthService";
    import CompanyService from '@/services/CompanyService';

    export default {
        data() {
            return {
                name: null,
                email: null,
                password : null,
                role : null,
                postLoading: false,
            };
        },
        mounted() {
            const currentProfile = JSON.parse(AuthService.getProfile());
            if(currentProfile.role != 'admin' ){
                this.$router.push('/user');
            }
        },
        methods: {
            async submitForm() {
                this.postLoading = true;
                try {
                    const userDt = {
                        name: this.name,
                        email: this.email,
                        password: this.password,
                        role: this.role
                    };
                    const user = await AuthService.register(userDt)
                    this.$router.push('/user');
                } catch (error) {
                    console.error('Error submitting form:', error);
                } finally {
                    this.postLoading = false;
                }
            },
        },
        computed: {
            isSubmitDisabled() {
                return (
                    !this.name ||
                    !this.email
                );
            },
        },
    };
</script>

<style>
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
</style>