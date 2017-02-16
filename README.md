# Setting up Trailblazer with Rails & React
## Cells, Reform, Roar, Representer are included as well

### Thanks before anything else
Without Nick Sutter and fine folks who contribute to Trailblazer, Cells, Reform, Roar, etc  - none of this would be possible. So - THANK YOU!

### Purpose and General comments

This started as a way to document my steps setting up a new Rails 5 project with Traiblazer 2.0. This isn't meant to be an authoritative
document - but I did poke brains of some of smart people on the TRB support channel on gitter as I was working on this. 

I would suggest in general to avoid all the extra baggage provided by Rails if you are not going to use it: sprockets, js, trubolinks, spring, etc. You could use --api flag as well. Having said that, this app was setup with everything in place. I only specified my DB of choice - MariaDB/MySQL. But you can use whatever you prefer - I highly recommend to match your production.


## Initial Setup

**Warning:** If you are going to have loading problems - 90% of problems with loading stuff in Rails + TRB can be traced to Spring and/or Rails autoloading. If you disable spring from the getgo, you may save yourself some headaches. TRB inspired tests, run very fast without spring. But there are some brave souls, who have been using Spring.

### Console

Suggested (once you are comfortable with TRB):

    rails new trailblazer-rails-basic-setup --skip-turbolinks 
                                            --skip-spring 
                                            --skip-sprockets 
                                            --skip-puma 
                                            --database=mysql

Actual (this setup):

      rails new trailblazer-rails-basic-setup --database=mysql



### Database:
Don't forget to setup test & dev DBs and setup user/pass in database.yml


### Update Gemfile

    # Trailblazer
    gem "trailblazer", '2.0.3'
    gem "trailblazer-rails"

    # If you want to replace ActiveView with the awesomeness of Cells
    gem "trailblazer-cells"

    # There are adapters for ERB, Slim & Haml as well. Hamlit is faster than both.
    gem "cells-hamlit"
    gem 'hamlit-rail'

    # For validation. You could stick with ActiveModel validations, but dry.rb stuff is nicer IMHO
    gem "dry-validation"

    # Add minitest to test / development. You are welcome to use rspec.
    gem 'minitest'

Disable stuff in Gemfile you won't need. For instance I run my stuff under passenger both in dev and production - there is no need to load Puma 
(an excelent webserver otherwise)

### application.rb
Some defaults in application.rb
    config.time_zone = 'Central Time (US & Canada)'

    config.generators do |g|
      # Hamlit uses haml name where possible, so it should be a drop-in replacement in most cases
      g.template_engine :haml
      g.test_framework :minitest, spec: true, fixture: false
    end

    # Up to you. You may want to set it up later
    config.active_job.queue_adapter = :delayed_job




#

Let's give our domain logic a home:

mkdir app/concepts
