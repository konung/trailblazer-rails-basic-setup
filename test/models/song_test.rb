require "test_helper"

describe Song do
  let(:song) { Song.new }

  it "must be valid" do
    value(song).must_be :valid?
  end
end
