# VIDEO SHARER API (Rails API)


## SUMMARY
# 1. What i have done: 
- Complete 4 page (both BE and FE): login, sign up, homepage, share video page
- Deploy to server in each stack
- Build Swagger to BE: https://mighty-anchorage-33559.herokuapp.com/api-docs/index.html
- FLOW FOR NEW USER: 
 * Create new user: POST users/ 
 * Log in user: POST sessions/signin

# 2.What i have not completed:
-  RealTime (Action cable + sidekiq + redis)
- Unit test
- Integration Test

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

# 7. Access app (local)
- Rails API root url: http://localhost:3000
- Swagger API documentation: http://localhost:3000/api-docs/index.html

# 8. Deploy ( Heroku)



# option
rails db:migrate RAILS_ENV=development

# start rails server
rails server --daemon
```

### REFERENCES
- https://devcenter.heroku.com/articles/getting-started-with-rails7