# n8n-railway-postgres
Deploy the latest version of n8n on Railway with PostgreSQL for data persistence

## Features

- Always uses the latest n8n Docker image
- PostgreSQL for reliable data storage
- Auto-updates enabled
- Community nodes support
- Secure configuration with encryption

## Deployment Instructions

### Option 1: Using the Railway Dashboard

1. **Create a new project in Railway**
   - Go to [Railway Dashboard](https://railway.app/dashboard)
   - Click "New Project" → "Deploy from GitHub repo"
   - Select this repository

2. **Add PostgreSQL service**
   - In your project, click "New Service" → "Database" → "PostgreSQL"
   - Railway will automatically provision a PostgreSQL instance

3. **Add n8n service**
   - In your project, click "New Service" → "GitHub Repo"
   - Select this repository
   - Railway will automatically detect the Dockerfile and build the service

4. **Configure Environment Variables**
   - Go to your n8n service
   - Navigate to "Variables" tab
   - Copy the variables from `.env.example` and add them to your service
   - Make sure to replace the placeholder values with actual secure values
   - Generate a secure random string for `N8N_ENCRYPTION_KEY`
   - Update the default passwords

5. **Deploy**
   - Railway will automatically deploy your service
   - If it doesn't, you can trigger a manual deploy

### Option 2: Using the Railway CLI

1. **Install Railway CLI**
   ```bash
   npm i -g @railway/cli
   ```

2. **Login to Railway**
   ```bash
   railway login
   ```

3. **Initialize a new project**
   ```bash
   railway init
   ```

4. **Add PostgreSQL service**
   ```bash
   railway add
   ```
   - Select PostgreSQL from the options

5. **Deploy the project**
   ```bash
   railway up
   ```

6. **Set environment variables**
   ```bash
   railway variables set DB_TYPE=postgresdb
   # Set other variables from the .env.example file
   ```

## Access Your n8n Instance

Once deployed, you can access your n8n instance at the URL provided by Railway.

## Important Notes

1. **Encryption Key**: Always set a strong `N8N_ENCRYPTION_KEY` and never change it after initial setup, as it's used to encrypt all credentials.

2. **Backups**: Regularly backup your PostgreSQL database to prevent data loss.

3. **Environment Variables**: The provided `.env.example` file uses Railway's variable interpolation syntax (`${{Postgres.PGHOST}}`) to automatically connect to the PostgreSQL service.

4. **Updates**: Since we're using the `latest` tag, your n8n instance will update to the latest version whenever Railway rebuilds the service.

## Troubleshooting

If you encounter issues with the connection to PostgreSQL, ensure that the environment variables are set correctly. Railway automatically sets up the connection between services, but you may need to verify the PostgreSQL service name in the connection variables.

## Security

Always change the default passwords in the `.env.example` file to strong, unique passwords. Enable basic authentication for additional security.