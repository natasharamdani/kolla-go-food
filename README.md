# README

This README would normally document whatever steps are necessary to get the
application up and running.

gem install rails
rails -v
rails new go-food
cd go-food
rails server
gem install therubyracer
bundle
rails s
rails generate controller Home hello
rails g model user
rails db:create
rails db:migrate
rails c
	User.connection
	User
	User.find(1)
	User.where(username: 'nanda')
	User.create(
		username: 'nanda',
		full_name: 'natasha'
	)
rails db:rollback
