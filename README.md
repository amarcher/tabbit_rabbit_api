# tabbit_rabbit_api
API for tab splitting

## Developer Setup

### Clone the repo:

`git clone https://github.com/amarcher/tabbit_rabbit_api.git && cd tabbit_rabbit_api`

### Install dependencies:

`gem install bundler` (if you don't have bundler)

`bundle install`

### Setting up the DB

[Set up Postgres](https://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/) (if you don't already have Postgres running)

`bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed`

### Running the test suite

`bundle exec rspec`
