FROM ruby:2.6.5-slim

WORKDIR /srv/slate

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        gnupg \
        curl \
        git \
        nodejs \
        npm

ADD .ruby-version Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

ADD package.json package-lock.json ./

RUN npm install

RUN apt-get remove -y build-essential git \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
