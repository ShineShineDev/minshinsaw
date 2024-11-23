## Review in live server
 https://mss.spideyshine.info/

#### Login to associate user account

- Admin Role

  ````ini
  email => admin@admin.com  
  password => password
  ````

  - Manager Role 

    ```ini
    email =>  manager@company.com   
    password => password
    ```


---------------


### Tech Stack
 - Vuejs with CoreUI
 - Laravel with passport
 - Mysql


### Downlaod Source Code  Link (Include Dependency )
https://drive.google.com/drive/folders/1PU7IDGP4QMb8H2VBd4GyaMsFyGQwWyfU?usp=sharing

 

#### Database Config

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=mss
DB_USERNAME=root
DB_PASSWORD=
```

- Import **`mss.sql`**

#### Postman collection

- Import **`postman_collection.json`** 

  > :warning:  Please change environment variables for local running Laravel

### Run Laravel 

```cmd
php artisan serve
```



### Run Vuejs

```
npm run serve
```

- Config file (`frontend/src/config.js`)

```js
export const BASE_URL = 'http://127.0.0.1:8000';
//export const BASE_URL = 'https://api-mss.spideyshine.info';
```

> http://localhost:8080/

###  



### Used Version

- php => 8.3

- node => v20

  



> Please let me know if you have any questions or errors
>
> - 09 7877 966 98
> - [aungshine194@gmail.com](mailto:aungshine194@gmail.com)
> - https://spideyshine.info/
