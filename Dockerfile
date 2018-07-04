FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /savethat
WORKDIR /savethat
COPY Gemfile /savethat/Gemfile
COPY Gemfile.lock /savethat/Gemfile.lock
RUN bundle install
COPY . /savethat