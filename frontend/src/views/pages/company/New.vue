<template>
    <div class="p-md-2">
        <div>
            Company / Create New
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
                    <label class="col-sm-6" for="phone">Phone:</label>
                    <div class="col-sm-6">
                        <input v-model="phone" class="form-control form-control-sm" id="phone" type="text" />
                    </div>
                </div>

                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="email">Email:</label>
                    <div class="col-sm-6">
                        <input v-model="email" class="form-control form-control-sm" id="email" type="email" />
                    </div>
                </div>

                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="website">Website:</label>
                    <div class="col-sm-6">
                        <input v-model="website" class="form-control form-control-sm" id="website" type="url" />
                    </div>
                </div>

                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="logo">Logo:</label>
                    <div class="col-sm-6">
                        <input ref="logo" @change="handleFileChange" class="form-control form-control-sm" id="logo"
                            type="file" accept="image/png, image/jpeg" />
                    </div>
                    <div v-if="LogoPreview" class="form-group row mt-3">
                        <label class="col-sm-6"></label>
                        <div class="col-sm-6">
                            <img :src="LogoPreview" alt="Profile Picture Preview" class="img-fluid rounded " style="max-width: 150px; max-height: 150px;" />
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6">
                        <button v-if="!postLoading" type="submit" :disabled="isSubmitDisabled" class="btn btn-sm btn-primary">
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
    import CompanyService from '@/services/CompanyService';
    import AuthService from '@/services/AuthService';

    export default {
        data() {
            return {
                name: '',
                phone: '',
                email: '',
                website: '',
                logoFile: null,
                LogoPreview : null,
                postLoading : false,
            };
        },
        mounted() {
            const currentProfile = JSON.parse(AuthService.getProfile());
            if(currentProfile.role != 'admin' ){
                this.$router.push('/company');
            }
        },
        methods: {
            handleFileChange(event) {
                const file = event.target.files[0];
                if (file) {
                    this.logoFile = file;
                    this.LogoPreview = URL.createObjectURL(file); 
                }
            },

            async submitForm() {
                this.postLoading = true;
                const formData = new FormData();
                formData.append('name', this.name);
                formData.append('phone', this.phone);
                formData.append('email', this.email);
                formData.append('website', this.website);
                if (this.logoFile) {
                    formData.append('logo', this.logoFile);
                }
                try {
                    const status = await CompanyService.create(formData);
                    this.$router.push('/company');
                } catch (error) {
                    console.error('Error submitting form:', error);
                }finally{
                    this.postLoading = false;
                }
            },
        },
        computed: {
            isSubmitDisabled() {
                return (
                    !this.name ||
                    !this.phone ||
                    !this.email ||
                    !this.website ||
                    !this.logoFile
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