FROM ruby:2.5
MAINTAINER Selvaraj Kalimuthu <ksraj.odc@gmail.com>

RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs

RUN mkdir /overwatch-api-dojo
WORKDIR /overwatch-api-dojo
COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler && bundle install --jobs 20 --retry 5

RUN bundle exec rails db:create
RUN bundle exec rails db:migrate
RUN rm -f tmp/pids/server.pid
ADD . /overwatch-api-dojo
