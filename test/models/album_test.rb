require "test_helper"

describe Album do
  let(:album) { Album.new }

  it "must be valid" do
    value(album).must_be :valid?
  end
end
