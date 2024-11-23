<template>
    <div class="p-md-2">
        <div>
            Users / All
            <div v-if="currentProfile?.role == 'admin'" style="float: right;" class="d-flex">
                <router-link to="newUser">
                    <button class="btn bg-info btn-sm text-white">
                        Add New
                    </button>
                </router-link>

            </div>
        </div>
        <div class="bg-white p-2 rounded mt-3">
            <table class="table table-hover table-striped border">
                <thead>
                    <tr>
                        <td class="py-1 bg-info text-white">
                            No
                        </td>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Name</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Email</th>
                        <th class="p-2 bg-info text-white" style="font-weight: normal;font-size:15px">Role</th>
                    </tr>
                </thead>
                <tbody v-if="fetchLoading">
                    <tr v-for="item in [1, 2, 3, 4, 5, 6]" :key="item">
                        <td colspan="6" class="bg-light animated-background pt-4"></td>
                    </tr>
                </tbody>
                <tbody>
                    <tr v-for="(item, index) in users" :key="index">
                        <td class="py-1 px-2">{{ index + 1 }}</td>
                        <td class="py-1 px-2">{{ item.name }}</td>
                        <td class="py-1 px-2">{{ item.email }}</td>
                        <td class="py-1 px-2">
                            <select class="form-control-select w-100 form-control-sm">
                                <option>{{ item.role }}</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>


    import AuthService from '@/services/AuthService';

    export default {
        name: "Bus",
        data() {
            return {
                users: [],
                fetchLoading: true,
                currentProfile: null
            };
        },
        methods: {

        },
        async mounted() {
            try {
                const { data } = await AuthService.users();
                this.users = data;
            } catch (error) {
                console.error('Error fetching bus:', error);
            } finally {
                this.fetchLoading = false;
            }
            const currentProfile = JSON.parse(AuthService.getProfile());
            this.currentProfile = currentProfile
            if (currentProfile.role != 'admin') {
                this.$router.push('/company');
            }
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