import { BASE_URL } from '@/config'
import authHeader from './auth-header';

class AuthService {

    async register(data) {
        console.log(data);
        try {
            const url = `${BASE_URL}/api/register`;
            const response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    ...authHeader(),
                },
                body: JSON.stringify(data),
            });
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const resdata = await response.json();
            return resdata;
            console.log('Registration response:', data);
        } catch (error) {
            console.error('Error registering:', error);
            throw error;
        }
    }

    async users() {
        try {
            const url = `${BASE_URL}/api/users`;
            const response = await fetch(url, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    ...authHeader(),
                },
            });
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            console.log('users response:', data);
            return data;
        } catch (error) {
            console.error('Error registering:', error);
            throw error;
        }
    }

    async login(email, password) {
        try {
            const LOGIN_URL = `${BASE_URL}/api/login`;
            const response = await fetch(LOGIN_URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    email,
                    password,
                }),
            });

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            const data = await response.json();
            console.log('Login response:', data.data);
            return data.data;
        } catch (error) {
            console.error('Error logging in:', error);
            throw error;
        }
    }
    isAuthenticated() {
        const token = localStorage.getItem('token');
        return !!token;
    }
    getProfile() {
        const user = localStorage.getItem('user');
        if (!!user) {
            return user;
        } else {
            return null
        }
    }
    logout() {
        localStorage.removeItem('user');
        localStorage.removeItem('token');
    }
}

export default new AuthService();
