require 'test_helper'

class HomeIndexCellTest < Cell::TestCase
  test "show" do
    title = "Test Title"
    struct = OpenStruct.new(title: title)
    html = Home::Cell::Index.(struct).(:show)
    assert_includes html, title
  end
end
