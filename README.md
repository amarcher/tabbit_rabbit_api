# tabbit_rabbit_api
API for tab splitting

## Routes

### Tabs

#### Show Tabs

Show all tabs for a user (requires auth token)

`/tab`

Response:

```
[
  {
    "id"=>358,
    "name"=>"Untitled Tab",
    "dine_date"=>"2016-09-14",
    "raw_text"=>nil,
    "url"=>nil,
    "img_url"=>nil,
    "user_id"=>749,
    "created_at"=>"2016-09-14T15:27:51.583Z",
    "updated_at"=>"2016-09-14T15:27:51.583Z"
  }
]
```

#### Create

Create a tab for this user (requires auth token)

`/tab`

         users POST   /users(.:format)                     users#create
          user GET    /users/:id(.:format)                 users#show
               PATCH  /users/:id(.:format)                 users#update
               PUT    /users/:id(.:format)                 users#update
               DELETE /users/:id(.:format)                 users#destroy
      sessions POST   /sessions(.:format)                  sessions#create
       session DELETE /sessions/:id(.:format)              sessions#destroy
tab_item_index GET    /tab/:tab_id/item(.:format)          item#index
               POST   /tab/:tab_id/item(.:format)          item#create
  new_tab_item GET    /tab/:tab_id/item/new(.:format)      item#new
 edit_tab_item GET    /tab/:tab_id/item/:id/edit(.:format) item#edit
      tab_item GET    /tab/:tab_id/item/:id(.:format)      item#show
               PATCH  /tab/:tab_id/item/:id(.:format)      item#update
               PUT    /tab/:tab_id/item/:id(.:format)      item#update
               DELETE /tab/:tab_id/item/:id(.:format)      item#destroy
     tab_index GET    /tab(.:format)                       tab#index
               POST   /tab(.:format)                       tab#create
       new_tab GET    /tab/new(.:format)                   tab#new
      edit_tab GET    /tab/:id/edit(.:format)              tab#edit
           tab GET    /tab/:id(.:format)                   tab#show
               PATCH  /tab/:id(.:format)                   tab#update
               PUT    /tab/:id(.:format)                   tab#update
               DELETE /tab/:id(.:format)                   tab#destroy

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
