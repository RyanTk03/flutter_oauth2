# OAuth2 Node.js Project Setup Guide

## 📦 Requirements

Ensure the following are installed on your machine or server:

- Node.js
- npm
- PostgreSQL

### Install on Ubuntu/Debian:

```bash
sudo apt update
sudo apt install nodejs npm postgresql postgresql-contrib -y
```
#### 🛠️ PostgreSQL Configuration
1. Switch to the PostgreSQL user and access psql:
```bash
sudo -i -u postgres
psql
```
2. Create a user, password, and database:
```sql
CREATE ROLE user WITH LOGIN PASSWORD 'user123';
CREATE DATABASE oauth_2 OWNER amine;
```
Replace user, user123, and oauth_2 with your own credentials.

3. Exit PostgreSQL:
```sql
\q
exit
```
#### ⚙️ Project Configuration
Open config/config.json and update the following fields in all environments (development, test, production):

```json
{
  "development": {
    "username": "user",
    "password": "user123",
    "database": "oauth_2",
    "host": "127.0.0.1",
    "dialect": "postgres"
  },
  "test": {
    "username": "user",
    "password": "user123",
    "database": "oauth_2",
    "host": "127.0.0.1",
    "dialect": "postgres"
  },
  "production": {
    "username": "user",
    "password": "user123",
    "database": "oauth_2",
    "host": "127.0.0.1",
    "dialect": "postgres"
  }
}
```

#### 🚀 Run the Project
In the project root directory, run the following commands:
```bash
npm install
npx sequelize-cli db:migrate
npm run start
```
The server will run on port 3000.

#### ⚠️ Note
Before start playing with the app, make sure to send a post request to the server to initialize the oauth client and oauth secret with these feature
- method: POST,
- url: server_address/oauth/token
- headers:
  - Content-Type: application/json
- body:
  ```json
  {
    "clientId": "express-client",
    "clientSecret": "express-secret",
    "grants": ["password", "refresh_token"]
  }
  ```
Replace express-client and express-secret with the appropriated client and secret token that you are using in the frontend
