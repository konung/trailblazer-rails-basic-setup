# HomeController - root of the Application
# require 'trailblazer/endpoint/rails' # set in to `config/initializers/trailblazer.rb`!

class HomeController < ApplicationController
  # We will need Trailblazer::Endpoint later to make our endpoints more concise
  # include Trailblazer::Endpoint::Controller

  def index
    model = OpenStruct.new(title: "I'm a title")

    respond_to do |format|
      format.html { render html: concept(Home::Cell::Index, model) }
      # Later on we will use Roar to create JSON & XML representers for our first "real model"
      # Here we are just testing responses to common formats
      format.json { render json: model }
      format.xml  { render xml: "<title>#{model.title}</title>" }
    end
  end
end
