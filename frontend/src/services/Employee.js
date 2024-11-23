import { BASE_URL } from '@/config';
import authHeader from './auth-header';

class Employee {
    constructor() {
        this.fetchLoading = false;
        this.employeeDetail = [];
        this.employees = [];
    }

    async fetchAll() {
        const URL = `${BASE_URL}/api/employees`;
        try {
            this.fetchLoading = true;
            const response = await fetch(URL, {
                headers: authHeader(),
            });
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            this.employees = data.data;
            console.log('employees API response:', data);
        } catch (error) {
            console.error('Error employees bus:', error);
        } finally {
            this.fetchLoading = false;
        }
    }

    async getByID(id) {
        const URL = `${BASE_URL}/api/employees/${id}`;
        try {
            this.fetchLoading = true;
            const response = await fetch(URL, {
                headers: authHeader(),
            });
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            this.employeeDetail = data.data;
            console.log('employee API response:', data);
        } catch (error) {
            console.error('Error fetching employee:', error);
        } finally {
            this.fetchLoading = false;
        }
    }
    async create(data) {
        const URL = `${BASE_URL}/api/employees`;
        try {
            const response = await fetch(URL, {
                method: 'POST',
                headers: {
                    ...authHeader(),
                },
                body: data,
            });

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return await response.json();
        } catch (error) {
            console.error('Error creating ticket:', error);
            throw error;
        }
    }
    async updateResource(data, id) {
        const URL = `${BASE_URL}/api/employees/${id}`;
        try {
            const response = await fetch(URL, {
                method: 'POST',
                headers: {
                    ...authHeader(),
                },
                body: data,
            });

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return await response.json();
        } catch (error) {
            console.error('Error creating ticket:', error);
            throw error;
        }
    }
    async deleteResource(id) {
        const URL = `${BASE_URL}/api/employees/${id}`;
        try {
            const response = await fetch(URL, {
                method: 'DELETE',
                headers: {
                    ...authHeader(),
                    Accept: "application/json"
                },
            });
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return await response.json();
        } catch (error) {
            console.error('Error :', error);
            throw error;
        }
    }
}

export default new Employee();
