require "test_helper"

describe Cover do
  let(:cover) { Cover.new }

  it "must be valid" do
    value(cover).must_be :valid?
  end
end
