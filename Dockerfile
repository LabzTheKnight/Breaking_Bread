# Use Ruby 3.1.2 as base image
FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    nodejs \
    npm \
    postgresql-client \
    build-essential \
    libpq-dev && \
    npm install -g yarn && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install npm packages
RUN yarn install

# Copy the rest of the application
COPY . .

# Precompile assets (for production) - skip if it fails
RUN RAILS_ENV=production SECRET_KEY_BASE=dummy bundle exec rake assets:precompile 2>/dev/null || echo "Skipping asset precompilation"

# Expose port 4000
EXPOSE 4000

# Copy entrypoint script
COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
