# Docker Setup for Breaking Bread

This guide will help you run the Breaking Bread application using Docker.

## Prerequisites

- Docker installed on your system
- Docker Compose installed

## Quick Start (Development)

1. **Copy the environment file:**
   ```bash
   cp .env.example .env
   ```

2. **Update the `.env` file with your credentials:**
   - Add your Cloudinary credentials
   - Other variables have sensible defaults for development

3. **Build and start the containers:**
   ```bash
   docker-compose up --build
   ```

4. **Create and seed the database (first time only):**
   In a new terminal:
   ```bash
   docker-compose exec web rails db:create db:migrate db:seed
   ```

5. **Access the application:**
   Open your browser to: http://localhost:3000

## Common Commands

### Start the application:
```bash
docker-compose up
```

### Start in detached mode (background):
```bash
docker-compose up -d
```

### Stop the application:
```bash
docker-compose down
```

### View logs:
```bash
docker-compose logs -f web
```

### Run Rails commands:
```bash
# Rails console
docker-compose exec web rails console

# Database migrations
docker-compose exec web rails db:migrate

# Run tests
docker-compose exec web rails test
```

### Rebuild containers (after Gemfile changes):
```bash
docker-compose up --build
```

### Reset database:
```bash
docker-compose exec web rails db:drop db:create db:migrate db:seed
```

## Production Deployment (VPS)

1. **Copy files to your VPS:**
   ```bash
   scp -r . user@your-vps-ip:/path/to/app
   ```

2. **SSH into your VPS:**
   ```bash
   ssh user@your-vps-ip
   cd /path/to/app
   ```

3. **Create production `.env` file:**
   ```bash
   cp .env.example .env
   nano .env
   ```
   Update with production credentials:
   - Cloudinary URL
   - Strong database password
   - Redis URL (if using external Redis)
   - SECRET_KEY_BASE (generate with: `rails secret`)

4. **Build and start in production mode:**
   ```bash
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d
   ```

5. **Create and migrate database:**
   ```bash
   docker-compose exec web rails db:create db:migrate
   ```

6. **Optional: Seed with sample data:**
   ```bash
   docker-compose exec web rails db:seed
   ```

## Updating the Application

1. **Pull latest changes:**
   ```bash
   git pull origin master
   ```

2. **Rebuild and restart:**
   ```bash
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d
   ```

3. **Run migrations if needed:**
   ```bash
   docker-compose exec web rails db:migrate
   ```

## Troubleshooting

### Port already in use:
```bash
# Stop other services using port 3000, or change the port in docker-compose.yml
docker-compose down
```

### Database connection issues:
```bash
# Check if database container is running
docker-compose ps

# Check database logs
docker-compose logs db
```

### Reset everything:
```bash
docker-compose down -v  # This removes volumes (data will be lost!)
docker-compose up --build
```

## Production Notes

- The production setup maps port 80 to the Rails application
- Make sure to set strong passwords in production
- Consider using a managed PostgreSQL and Redis service for better reliability
- Set up SSL/TLS with nginx or a reverse proxy
- Regular database backups are recommended

## Backup Database

```bash
# Create backup
docker-compose exec db pg_dump -U postgres Breaking_Bread_production > backup.sql

# Restore backup
cat backup.sql | docker-compose exec -T db psql -U postgres Breaking_Bread_production
```
