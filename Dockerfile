# Options: 2.7, 3.1, 3.2-rc, latest
FROM ruby:2.7

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install
RUN ./db-reset.sh
CMD ruby server.rb
