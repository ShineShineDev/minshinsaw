import { BASE_URL } from '@/config';
import authHeader from './auth-header';

class CompanyService {
    constructor() {
        this.fetchLoading = false;
        this.companyDetail = [];
        this.companies = [];
    }

    async get() {
        const URL = `${BASE_URL}/api/companies`;
        try {
            this.fetchLoading = true;
            const response = await fetch(URL, {
                headers: authHeader(),
            });
            console.log(authHeader());
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            this.companies = data.data;
            console.log('companies API response:', data);
        } catch (error) {
            console.error('Error fetching companies:', error);
        } finally {
            this.fetchLoading = false;
        }
    }

    async getByID(id) {
        const URL = `${BASE_URL}/api/companies/${id}`;
        try {
            this.fetchLoading = true;
            const response = await fetch(URL, {
                headers: authHeader(),
            });
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            this.companyDetail = data.data;
            console.log('company API response:', data.data);
            return data.data;
        } catch (error) {
            console.error('Error fetching companies:', error);
        } finally {
            this.fetchLoading = false;
        }
    }
    async create(data) {
        const URL = `${BASE_URL}/api/companies`;
        try {
            const response = await fetch(URL, {
                method: 'POST',
                headers: {
                    ...authHeader(),
                    Accept: "application/json"
                },
                body: data,
            });
            console.log(response);

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return await response.json();
        } catch (error) {
            console.error('Error creating :', error);
            throw error;
        }
    }
    async update(data, id) {
        const URL = `${BASE_URL}/api/companies/${id}`;
        try {
            const response = await fetch(URL, {
                method: 'POST',
                headers: {
                    ...authHeader(),
                    Accept: "application/json"
                },
                body: data,
            });
            console.log(response);

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return await response.json();
        } catch (error) {
            console.error('Error creating :', error);
            throw error;
        }
    }
    async deleteResource(id) {
        const URL = `${BASE_URL}/api/companies/${id}`;
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
    async statistics() {
        const URL = `${BASE_URL}/api/statistics`;
        try {
            this.fetchLoading = true;
            const response = await fetch(URL, {
                headers: authHeader(),
            });
            console.log(authHeader());
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            console.log('statistics API response:', data);
            return data;
        } catch (error) {
            console.error('Error fetching companies:', error);
        } finally {
            this.fetchLoading = false;
        }
    }
    async recent() {
        const URL = `${BASE_URL}/api/recent`;
        try {
            this.fetchLoading = true;
            const response = await fetch(URL, {
                headers: authHeader(),
            });
            console.log(authHeader());
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            console.log('recent API response:', data);
            return data;
        } catch (error) {
            console.error('Error fetching companies:', error);
        } finally {
            this.fetchLoading = false;
        }
    }
}

export default new CompanyService();
