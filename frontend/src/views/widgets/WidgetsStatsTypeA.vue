<template>
    <CRow>
        <CCol :xs="3" v-if="user?.role == 'admin'">
            <CWidgetStatsA class="mb-4" color="primary">
                <template #value>{{statistics?.companies_count}}</template>
                <template #title>Total Companies</template>
                <template #chart>
                    <CChart type="line" class="mt-3 mx-3" style="height: 70px" :data="{
                            labels: [
                                'January',
                                'February',
                                'March',
                                'April',
                                'May',
                                'June',
                                'July',
                            ],
                            datasets: [
                                {
                                    label: 'My First dataset',
                                    backgroundColor: 'transparent',
                                    borderColor: 'rgba(255,255,255,.55)',
                                    pointBackgroundColor: '#321fdb',
                                    data: [68, 59, 84, 84, 51, 55, 40],
                                },
                            ],
                        }" :options="{
                            plugins: {
                                legend: {
                                    display: false,
                                },
                            },
                            maintainAspectRatio: false,
                            scales: {
                                x: {
                                    grid: {
                                        display: false,
                                        drawBorder: false,
                                    },
                                    ticks: {
                                        display: false,
                                    },
                                },
                                y: {
                                    min: 30,
                                    max: 89,
                                    display: false,
                                    grid: {
                                        display: false,
                                    },
                                    ticks: {
                                        display: false,
                                    },
                                },
                            },
                            elements: {
                                line: {
                                    borderWidth: 1,
                                    tension: 0.4,
                                },
                                point: {
                                    radius: 4,
                                    hitRadius: 10,
                                    hoverRadius: 4,
                                },
                            },
                        }" />
                </template>
            </CWidgetStatsA>
        </CCol>
        <CCol :xs="3">
            <CWidgetStatsA class="mb-4" color="info">
                <template #value>{{statistics?.emp_count}}</template>
                <template #title>Total Employees</template>
                <template #chart>
                    <CChart type="line" class="mt-3 mx-3" style="height: 70px" :data="{
                            labels: [
                                'January',
                                'February',
                                'March',
                                'April',
                                'May',
                                'June',
                                'July',
                            ],
                            datasets: [
                                {
                                    label: 'My First dataset',
                                    backgroundColor: 'transparent',
                                    borderColor: 'rgba(255,255,255,.55)',
                                    pointBackgroundColor: '#39f',
                                    data: [1, 18, 9, 17, 34, 22, 11],
                                },
                            ],
                        }" :options="{
                            plugins: {
                                legend: {
                                    display: false,
                                },
                            },
                            maintainAspectRatio: false,
                            scales: {
                                x: {
                                    grid: {
                                        display: false,
                                        drawBorder: false,
                                    },
                                    ticks: {
                                        display: false,
                                    },
                                },
                                y: {
                                    min: -9,
                                    max: 39,
                                    display: false,
                                    grid: {
                                        display: false,
                                    },
                                    ticks: {
                                        display: false,
                                    },
                                },
                            },
                            elements: {
                                line: {
                                    borderWidth: 1,
                                },
                                point: {
                                    radius: 4,
                                    hitRadius: 10,
                                    hoverRadius: 4,
                                },
                            },
                        }" />
                </template>
            </CWidgetStatsA>
        </CCol>
        <CCol :xs="3" v-if="user?.role == 'admin'">
            <CWidgetStatsA class="mb-4" color="warning">
                <template #value>{{statistics?.user_count}}</template>
                <template #title>Total Users</template>
                <template #chart>
                    <CChart type="line" class="mt-3" style="height: 70px" :data="{
                            labels: [
                                'January',
                                'February',
                                'March',
                                'April',
                                'May',
                                'June',
                                'July',
                            ],
                            datasets: [
                                {
                                    label: 'My First dataset',
                                    backgroundColor: 'rgba(255,255,255,.2)',
                                    borderColor: 'rgba(255,255,255,.55)',
                                    data: [78, 81, 80, 45, 34, 12, 40],
                                    fill: true,
                                },
                            ],
                        }" :options="{
                            plugins: {
                                legend: {
                                    display: false,
                                },
                            },
                            maintainAspectRatio: false,
                            scales: {
                                x: {
                                    display: false,
                                },
                                y: {
                                    display: false,
                                },
                            },
                            elements: {
                                line: {
                                    borderWidth: 2,
                                    tension: 0.4,
                                },
                                point: {
                                    radius: 0,
                                    hitRadius: 10,
                                    hoverRadius: 4,
                                },
                            },
                        }" />
                </template>
            </CWidgetStatsA>
        </CCol>
    </CRow>
</template>

<script>
    import { CChart } from "@coreui/vue-chartjs";
    export default {
        name: "WidgetsStatsA",
        components: {
            CChart,
        },
        props: {
            statistics: {
                type: Object,
                required: true
            },
            user : {
                type: Object,
                required: true
            }
        }
    };
</script>