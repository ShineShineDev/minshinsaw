<template>
    <div class="p-md-2">
        <div>
            Company / Create New
            <router-link to="/ticket">
                <button class="btn bg-info btn-sm text-white" style="float: right;">
                    <i class="bi bi-x-circle-fill"></i>
                </button>
            </router-link>
        </div>
        <div class="bg-white p-2 rounded mt-3 px-md-5 p-2 py-3">
            <form @submit.prevent="submitForm">
                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="name">Name</label>
                    <div class="col-sm-6">
                        <input v-model="name" class="form-control form-control-sm" id="name" type="text"
                             required />
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="email">Email</label>
                    <div class="col-sm-6">
                        <input v-model="email" class="form-control form-control-sm" id="email" type="email"
                            placeholder="example@domain.com" required />
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="phone">Phone</label>
                    <div class="col-sm-6">
                        <input v-model="phone" class="form-control form-control-sm" id="phone" type="text"
                            placeholder="Phone number" required />
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="company">
                        Company
                    </label>
                    <div class="col-sm-6">
                        <div v-if="fetchLoading" class="spinner-border text-primary" role="status">
                            <span class="sr-only"></span>
                        </div>
                        <select class="form-control-select w-100 form-control-sm" v-if="!fetchLoading" v-model="company_id">
                            <option>Select Company</option>
                            <option :key="company.id" :value="company.id" v-for="(company,index) in companies">
                                {{company.name}}
                            </option>
                        </select>
                    </div>
                </div>
                <div class="form-group row mt-3">
                    <label class="col-sm-6" for="profilePicture">Profile Picture</label>
                    <div class="col-sm-6">
                        <input @change="handleFileUpload" class="form-control form-control-sm" id="profilePicture"
                            type="file" accept="image/png, image/jpeg"/>
                    </div>
                    <div v-if="profilePicturePreview" class="form-group row mt-3">
                        <label class="col-sm-6"></label>
                        <div class="col-sm-6">
                            <img :src="profilePicturePreview" alt="Profile Picture Preview" class="img-fluid rounded " style="max-width: 150px; max-height: 150px;" />
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6">
                        <button v-if="!postLoading"  type="submit" :disabled="isSubmitDisabled"  class="btn btn-sm btn-primary">
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
    import Employee from '@/services/Employee';
    import AuthService from '@/services/AuthService';
    import CompanyService from '@/services/CompanyService';
    export default {
        data() {
            return {
                name: '',
                email: '',
                phone: '',
                company_id: '',
                profile: null,
                companies: [],
                profilePicturePreview : null,
                fetchLoading: false,
                postLoading : false,

            };
        },
        async mounted() {
            const currentProfile = JSON.parse(AuthService.getProfile());
            if(currentProfile.role != 'admin' ){
                this.$router.push('/employee');
            }

            try {
                this.fetchLoading = true;
                await CompanyService.get()
                this.companies = CompanyService.companies.reverse()
            } catch (error) {
                console.error('Error fetching bus:', error);
            } finally {
                this.fetchLoading = false;
            }
        },
        computed: {
            isSubmitDisabled() {
                return !this.name || !this.email || !this.phone || !this.company_id || !this.profile;
            },
        },
        methods: {
            handleFileUpload(event) {
                const file = event.target.files[0];
                if (file) {
                    this.profile = file;
                    this.profilePicturePreview = URL.createObjectURL(file); // Create object URL for preview
                }
            },
            async submitForm() {
                const formData = new FormData();
                formData.append('name', this.name);
                formData.append('email', this.email);
                formData.append('phone', this.phone);
                formData.append('companies_id', this.company_id);
                formData.append('profile', this.profile);
                console.log(this.name,this.email,this.phone,this.company_id,this.profile);
                this.postLoading = true;
                try {
                    const status = await Employee.create(formData);
                    this.$router.push('/employee');
                } catch (error) {
                    console.error('Error submitting form:', error);
                }finally{
                    this.postLoading = false;
                }
            },
        },
    };
</script>

<style scoped>
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