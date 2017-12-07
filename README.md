# Go-Food using Ruby on Rails

This README would document whatever steps are necessary to get the application up and running.

## Prerequisites

What things you need to install the software and how to install them.

### Install Rails then check the version

```
gem install rails
rails -v
```

## Installing Project

A step by step that tell what you have to do to get a development environment running.

### Create new project named 'go-food' then change directory into it

```
rails new go-food
cd go-food
```

### Create Database

```
rails db:create
rails db:migrate
rails db:seed
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

<!-- An example of getting some data out of the system or using it for a little demo -->