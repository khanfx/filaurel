# Overview

Simple toy eBills service to post ebills and payments, and keep track of which ones have been paid.

Test bed for trying out Ruby code.

Built with Ruby, Sinatra, and SQLite

# Pre-requisites

Use WSL on Windows to ensure you have a full Linux environment, preferably Ubuntu

Install Ruby & SQLite:

> sudo apt-get install ruby-full ruby-bundler sqlite

Run Ruby bundler to grab all Ruby dependencies

> bundle install

# Usage

Run `./db-reset.sh` to set up the db.

`ruby server.rb` to start the server.

`./test.ps1` from Windows to test it.

# Next steps

- Set up Shotgun so we don't have to restart the server constantly
  - https://github.com/rtomayko/shotgun
- Refactor into onion architecture / ports and adapters pattern
- Unit tests
- Add validation, logging, events
- Docker
- Using job system, after payment is posted, figure out if ebill is paid and update status via an EbillUpdate record
  - i.e. something like Sidekiq to run jobs (or even RabbitMQ)
  - https://github.com/mperham/sidekiq/wiki/Getting-Started
- Map the ActiveRecord models onto a more appropriate response model


# Docker

docker build -t ebilltoy .

docker container run --name ebilltoy-1 --rm -it -p 4567:4567 ebilltoy

docker system prune -a

