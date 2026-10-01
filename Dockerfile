FROM ruby:3.3.12-slim-trixie

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    git \
    curl \
    libvips \
    postgresql-client && \
    curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN npm install --global yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set without 'development test' && \
    bundle install --jobs 4

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build:css && \
    SECRET_KEY_BASE=dummy RAILS_ENV=production bundle exec rake assets:precompile

EXPOSE 3001
CMD ["bash", "-c", "bundle exec rails db:migrate && bundle exec puma -C config/puma.rb"]
