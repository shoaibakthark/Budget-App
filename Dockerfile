FROM ruby:3.1.7

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install

# Copy the rest of the app's code into the container
COPY . /app

# Precompile assets (if needed)
# RUN RAILS_ENV=production bundle exec rake assets:precompile

# Start the Rails server (or use whatever entrypoint is appropriate for your app)
CMD ["rails", "server", "-b", "0.0.0.0"]

