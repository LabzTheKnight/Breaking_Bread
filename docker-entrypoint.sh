#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /app/tmp/pids/server.pid

# Wait for database to be ready
echo "Waiting for database to be ready..."
until PGPASSWORD=$DATABASE_PASSWORD psql -h "$DATABASE_HOST" -U "$DATABASE_USER" -c '\q' 2>/dev/null; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

echo "Database is ready!"

# Create database if it doesn't exist
bundle exec rails db:create 2>/dev/null || true

# Run database migrations
echo "Running database migrations..."
bundle exec rails db:migrate

# Seed database in development only (first time)
if [ "$RAILS_ENV" = "development" ]; then
  echo "Checking if database needs seeding..."
  bundle exec rails db:seed:replant 2>/dev/null || bundle exec rails db:seed
  
  echo "Building webpack assets..."
  yarn build
fi

# Execute the main command
exec "$@"
