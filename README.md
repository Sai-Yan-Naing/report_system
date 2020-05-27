# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
solve bcrypt with gem install bcrypt-ruby --platform=ruby
https://github.com/codahale/bcrypt-ruby/issues/85

<!-- for admin create -->

User.create(name:"sai yan naing", email:"sai@gmail.com", department:"system", team:"ruby", password:"admin123")


<!-- push to heroku server -->
git push heroku master


<!-- heroku console -->
heroku run rails console

How to reset PG Database on Heroku?
Step 1: heroku restart.
Step 2: heroku pg:reset DATABASE (no need to change the DATABASE )
Step 3: heroku run rake db:migrate.
Step 4: heroku run rake db:seed (if you have seed)
