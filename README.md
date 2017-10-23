# Go-Food using Ruby on Rails

This README would normally document whatever steps are necessary to get the application up and running.

## Prerequisites

What things you need to install the software and how to install them.

### Install Rails then check the version

```
gem install rails
rails -v
```

### Create new project named 'go-food' then change directory into it

```
rails new go-food
cd go-food
```

### Run Rails Server

```
rails server
```

or

```
rails s
```

#### If countered error, install 'therubyracer' then bundle it. Run the Server again

```
gem install therubyracer
bundle
```

## Installing

A step by step series of examples that tell what you have to do to get a development environment running.

Ruby on Rails (RoR) is a web-application framework written in Ruby that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern.

### Generate Controller (and View)

Generate a controller named 'Home' with an action called 'hello'

```
rails generate controller Home hello
```

or

```
rails g controller Home hello
```

It will create a file named 'home_controller.rb' inside the '/go-food/app/controllers' folder,

```
# This is controller file
class HomeController < ApplicationController
  def hello
  end
end
```

and a file named 'hello.html.erb' inside the '/go-food/app/views/home' folder.

```
# This is view file
<h1>Home#hello</h1>
<p>Find me in app/views/home/hello.html.erb</p>
```

### Generate Model

Generate a model named 'user'

```
rails g model user
```

It will create a file named 'user.rb' inside the '/go-food/app/models' folder,

```
# This is model file
class User < ApplicationRecord
end
```

and a file named 'create_users.rb' inside the '/go-food/db/migrate' folder.

```
# This is migrate file
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps
    end
  end
end
```

### Database Create and Migrate

```
rails db:create
rails db:migrate
```

## Rails Console

```
rails console
```

or

```
rails c
```

### Model and Database

Establish a connection

```
User.connection
```

Show table

```
User
```

Other syntaxes

```
User.find(1)
```

```
User.where(username: 'nanda')
```

```
User.create(
		username: 'nanda',
		full_name: 'natasha'
	)
```

```
rails db:rollback
```

An example of getting some data out of the system or using it for a little demo