# Line CRM API (Rails API)

# 1. Prerequisites
- Ruby 3.2.0
- Rails 7.0.4.3

# 2. Preparation 
- Open your terminal then cd to the project home

# 3. Install dependencies
```
bundle install
```

# 4. Run db migrations
```
rails db:migrate
```

# 5. Re-generate swagger API documentation if needed
```
rails rswag
```
or
```
rails rswag:specs:swaggerize
```
# 6. Start rails API
```
rails s
```

# 7. Access app
- Rails API root url: http://localhost:3000
- Swagger API documentation: http://localhost:3000/api-docs/index.html

# 8. Deploy
- Edit config/deploy/staging.rb
```
set :ssh_options, {
  keys: %w([YOUR_KEY_PATH]),
  forward_agent: false,
  auth_methods: %w(publickey)
}
```
- Run
```
cap staging deploy
```
- SSH to EC2
```
cd ~/deploy/line-crm-api/current/
```
- Run
```
# stop rails server
kill `cat tmp/pids/server.pid`
```
- Run
```
# option
bundle config unset deployment
bundle lock --add-platform x86_64-linux
bundle install

# option
rails db:migrate RAILS_ENV=development

# start rails server
rails server --daemon
```