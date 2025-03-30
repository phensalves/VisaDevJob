FROM ruby:3.4.1-slim

RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client build-essential libpq-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install && bundle binstubs rails --force

COPY . .

ENV PATH="/app/bin:$PATH"

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
