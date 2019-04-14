FROM ruby:2.5
MAINTAINER Selvaraj Kalimuthu <ksraj.odc@gmail.com>

RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs

RUN mkdir /overwatch-api-dojo
WORKDIR /overwatch-api-dojo
COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
RUN rm -f tmp/pids/server.pid
ADD . /overwatch-api-dojo
