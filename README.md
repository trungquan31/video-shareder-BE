# VIDEO SHARER API (Rails API)


## SUMMARY
# 1. What i have done: 
- Complete 4 page (both BE and FE): login, sign up, homepage, share video page
- Deploy to server in each stack
- Build Swagger to BE
# 2.What i have not completed:
-  RealTime (Action cable + sidekiq + redis)
- Unit test
- Integration Test
- Connect two servers (FE + BE): I have deploy success but netify do not allow to send http request => fail to connect FE to BE
+ BE: 54.169.130.113
+ FE: spiffy-queijadas-e4c14a.netlify.app

THIS IS A SHORT DEMO FOR WHAT I HAVE DONE SO FAR: https://drive.google.com/file/d/1w0UYLHzfTN-I-7jdcoFsJBb3v1lW60Ci/view?usp=sharing

## PROJECT DETAILS
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
cd ~/deploy/video_sharer_be/current/
```
- Run
```
# stop rails server
kill `cat tmp/pids/server.pid`
```
- Run
```

# option
rails db:migrate RAILS_ENV=development

# start rails server
rails server --daemon
```