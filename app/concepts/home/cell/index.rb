module Home::Cell            # namespace
  class Index < Trailblazer::Cell # class
    include ::Cell::Hamlit
    # If you 'model' has properties you want to use in you cell - this is a place to define them
    # you can can also use a 'model-less' cell. Or use a Struct or PORO in place of a 'model'
    
    property :title
    
    # This coule be passed this this cell as following to be use in Cell or View
    # Home::Cell::Index.(OpenStruct.new(title: "I'm a title")).show

    def show
      @string = 'I am a cell instance variable from Home::Cell::Index, you can use me in the view'
      render
    end
  end
end