<template>
    <div>
        <div v-if="fetchLoading" class="spinner-border text-primary" role="status">
            <span class="sr-only"></span>
        </div>
        <WidgetsStatsA :statistics="statistics" :user="user"/>
        <div class="">
            <div class="row">
                <div class="col-md-12 bg-white rounded">
                    <h5 class="m-2 border-bottom pb-2">Recent Companies</h5>
                    <CTable>
                        <CTableHead>
                            <CTableRow>
                                <CTableHeaderCell scope="col">Name</CTableHeaderCell>
                                <CTableHeaderCell scope="col">Phone</CTableHeaderCell>
                                <CTableHeaderCell scope="col">Email</CTableHeaderCell>
                                <CTableHeaderCell scope="col">Logo</CTableHeaderCell>
                                <CTableHeaderCell scope="col">Website</CTableHeaderCell>
                            </CTableRow>
                        </CTableHead>
                        <CTableBody>
                            <CTableRow v-for="(item,index) in recent?.companies">
                                <CTableDataCell>{{item.name}}</CTableDataCell>
                                <CTableDataCell>{{item.phone}}</CTableDataCell>
                                <CTableDataCell>{{item.email}}</CTableDataCell>
                                <CTableDataCell><img :src="item.logo" style="height: 50px;width: 50px;border-radius:50%" class="img-fluild"></CTableDataCell>
                                <CTableDataCell>{{item.website}}</CTableDataCell>
                            </CTableRow>
                        </CTableBody>
                    </CTable>
                </div>
                <div v-if="user?.role == 'admin'" class="col-md-12 bg-white rounded mt-3">
                    <h5 class="m-2 border-bottom pb-2">Recent Employees</h5>
                    <CTable>
                        <CTableHead>
                            <CTableRow>
                                <CTableHeaderCell scope="col">Name</CTableHeaderCell>
                                <CTableHeaderCell scope="col">Email</CTableHeaderCell>
                                <CTableHeaderCell scope="col">Phone</CTableHeaderCell>
                                <CTableHeaderCell scope="col">Profile </CTableHeaderCell>
                                <CTableHeaderCell scope="col">Company </CTableHeaderCell>
                            </CTableRow>
                        </CTableHead>
                        <CTableBody>
                            <CTableRow v-for="(item,index) in recent?.emp">
                                <CTableDataCell>{{item.name}}</CTableDataCell>
                                <CTableDataCell>{{item.email}}</CTableDataCell>
                                <CTableDataCell>{{item.phone}}</CTableDataCell>
                                <CTableDataCell><img :src="item.profile" style="height: 50px;width: 50px;border-radius:50%" class="img-fluild"></CTableDataCell>
                                <CTableDataCell>{{item.company?.name}}</CTableDataCell>
                            </CTableRow>
                        </CTableBody>
                    </CTable>
                </div>
                <div class="card mt-3 mb-5">
                    <MainChartExample/>
                </div>
            </div>
        </div>

    </div>
</template>
<script>
    import MainChartExample from "./charts/MainChartExample";
    import WidgetsStatsA from "./widgets/WidgetsStatsTypeA.vue";
    import WidgetsStatsD from "./widgets/WidgetsStatsTypeD.vue";
    import CompanyService from '@/services/CompanyService';
 
    import AuthService from '@/services/AuthService';

    export default {
        name: "Dashboard",
        components: {
            WidgetsStatsA,
            MainChartExample
        },
        data() {
            return {
                fetchLoading: true,
                user: null,
                statistics : null,
                recent : {},
            };
        },
        async mounted() {
            const currentProfile = JSON.parse(AuthService.getProfile());
            this.user = currentProfile

            try {
                const statistics = await CompanyService.statistics()
                this.statistics = statistics.data;

                const recent = await CompanyService.recent()
                this.recent = recent.data;
            } catch (error) {
                console.error('Error:', error);
            } finally {
                this.fetchLoading = false;
            }
        },
    };
</script>