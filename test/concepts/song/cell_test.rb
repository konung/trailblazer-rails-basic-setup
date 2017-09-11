require 'test_helper'

class SongConceptTest < Cell::TestCase
  test "show" do
    title = "Find me"
    html =  Song::Cell::Show.().(:show)
    assert_includes html, title
  end
end
