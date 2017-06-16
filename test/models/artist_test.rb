require "test_helper"

describe Artist do
  let(:artist) { Artist.new }

  it "must be valid" do
    value(artist).must_be :valid?
  end
end
