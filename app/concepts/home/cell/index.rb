module Home::Cell            # namespace
  class Index < Trailblazer::Cell # class
    include ::Cell::Hamlit
    # If your 'model' has properties you want to use in you cell - this is a place to define them
    # you can can also use a 'model-less' cell. Or use a Struct or PORO in place of a 'model'

    property :title

    # This coule be passed to this cell like so
    # Home::Cell::Index.(OpenStruct.new(title: "I'm a title")).show

    def show
      @string = 'I am a cell instance variable from Home::Cell::Index, you can use me in the view'
      render
    end
  end
end