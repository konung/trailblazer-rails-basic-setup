# Setting up Trailblazer with Rails & React
## Cells, Reform, Roar, Representer are included as well

### Thanks before anything else
Without [Nick Sutterer](https://github.com/apotonick) and fine folks who contribute to [Trailblazer, Cells, Reform, Roar,
etc](http://trailblazer.to/)  - none of this would be possible. So - THANK YOU!

### Purpose and General comments

This started as a way to document my steps setting up a new Rails 5 project with Traiblazer 2.0. This isn't meant to be an authoritative document - but I did poke brains of some of smart people on the TRB support channel on gitter as I was working on this.

I would suggest in general to avoid all the extra baggage provided by Rails if you are not going to use it: sprockets, js, trubolinks, spring, etc. You could use --api flag as well. Having said that, this app was setup with everything in place. I only specified my DB of choice - MariaDB/MySQL. But you can use whatever you prefer - I highly recommend to match your production.



## Just get to it already
If you want to - you can just clone the repo and pick up from where I left off, and refer to this Readme and TRB docs as a guide. Keep reading on if you want to get some "best practices" tips as discussed on the Gitter channel, and how everything fits togeather.


## Initial Setup
**Warning 1:** You need to use Ruby 2.2 ~ 2.3 . There are currently problems with Rails 5 with TRB on Ruby 2.4 yet because of the Bignum/ Fixnum change and changes to Forwardable. As well as some other common non-trb gems  don't work yet. There is a .ruby-version file in the root of the project, that indicated which version of ruby to be used by rbenv, if you use it. It's locked to 2.3.4 , but you can try it with other versions.

**Warning 2:** If you are going to have loading problems - 50% of problems with loading stuff in Rails + TRB can be traced to Spring and/or Rails autoloading. If you disable spring from the getgo, you may save yourself some headaches. TRB inspired tests, run very fast without spring. But there are some brave souls, who have been using Spring with success. The other 50% of loading problems usually end up being incorrectly namespaced Concepts - Cells, Operations, Contracts, etc.

**Warning 3:** This is more or less accurate and working as of July 2017. TRB is developing very quickly, and some stuff may change. I will try to lock relevant gems in Gemfile to a specific version.

**Warning 4:** Gems are locked to specific versions to ensure

### Console

Suggested (once you are comfortable with TRB):
```shell
    rails new trailblazer-rails-basic-setup --skip-turbolinks
                                            --skip-sprockets
                                            --skip-puma
                                            --database=mysql
```
Actual (used in this setup):
```shell
      rails new trailblazer-rails-basic-setup --database=mysql
```


### Database:
Don't forget to setup test & dev DBs and setup user/pass in database.yml


### Update Gemfile

```ruby
    # Trailblazer
    gem "trailblazer", '2.0.6'
    gem "trailblazer-rails"

    # If you want to replace ActionView with the awesomeness of Cells
    # Otherwise what are you doing here? ;-)
    gem "trailblazer-cells"

    # There are adapters for ERB, Slim & Haml as well. Hamlit is faster than both.
    # If you are planing on using fancy form building with Simple Form or Formtastic - use Slim or Haml or ERB.
    # Also there is Formular form builder, developed by TRB team. Check it out, it's pretty awesome.
    # Hamlit right now has a small bug, that's being worked on. I prefer to build my UI using React,
    # so it's not really an issue, as I don't generate forms forms dynamically.
    # If you find that hamlit doesn't work you can always switch-back to Haml, they are interchangable/.
    gem "cells-hamlit"
    gem 'hamlit-rail'

    # For validation. You could stick with ActiveModel validations, but dry.rb stuff is better IMHO
    gem "dry-validation"

    # Add minitest to test / development. You are welcome to use rspec.
    gem 'minitest'
```
Disable stuff in Gemfile you won't need. For instance I run my stuff under passenger both in dev and production - there is no need to load Puma
(an excelent webserver otherwise)

Most gems are locked up to minor version, so that you can have a good working known setup. You can update gems as needed.

### application.rb
Some defaults in config/application.rb
```ruby
    config.time_zone = 'Central Time (US & Canada)'

    config.generators do |g|
      # Hamlit uses haml name where possible, so it should be a drop-in replacement in most cases
      g.template_engine :haml
      g.test_framework :minitest, spec: true, fixture: false
    end

    # Up to you. You may want to set it up later or use sidekiq or something else.
    config.active_job.queue_adapter = :delayed_job

```


# Getting Home page up and running

Let's give our domain logic a place and also setup a root controller called Home, place for Layouts, and a root route

Create this folder / file structure
```
-- app
---- concepts
------ home
-------- cell
---------- index.rb
-------- view
---------- index.haml
-------- layout
```

```shell
rails g controller home
```

```ruby
# routes.rb
  root 'home#index'
```


## Run pending migrations
```shell
# Since you are getting a proejct that was already setup, it will run several sample migrations,
# that were actually setup later. These are models such as Song, Album, Cover, Artist.
# You can simply remove them - they are there just to serve as an example.
# If you don't create these tables now, Rails server won't bootup, complaining of pending migrations.
rake db:migrate

# If you want just to bootup server and look at home page you can also change this setting, and boot up without running migrations

 # in config/environments/development.rb
 config.active_record.migration_error = false
 # Or comment out that line if it's set to :page_load
```

## Bootup
```shell
rails s
```

Now you can try hiting :
http://localhost:3000/home/index.json
http://localhost:3000/home/index.html

## What did we do to get here?
Check out these files to understand what's happening:
app/controllers/home_controller.rb has an index action. When we hit it, we process the request and call up a Cell, that lives in app/concepts/home/cell/index.rb

It's pretty straightforward. As we explore more involved structures and concepts, you will notice, that overall - the architecture is the same: simple and straightforward. It's very easy to keep a mental model of a fairly large project.

## Easy tests
It's ridiculously easy to test home view now. Check out test/concepts/home/index_cell_test.rb

## No more ActionView
We can comment out ActionView now.
 ```ruby
# in config/application.rb
#require 'action_view/railtie'
 ```
Our app is blazingly fast .  Granted we haven't created any complicated models and view yet, but 4ms views? 1ms json responses? on Rails? It's possible....



# Let's create a song controller, view, reform, etc. Everything a modern concept needs ;-)