require 'test_helper'

class SongConceptTest < Cell::TestCase
  test "show" do
    html = concept("song/cell").(:show)
    assert html.match /<p>/
  end


end
