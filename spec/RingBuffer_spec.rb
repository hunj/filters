# Testing for RingBuffer.rb

require './lib/RingBuffer.rb'

describe RingBuffer do
  before(:each) do
    @ringb = RingBuffer.new(3)
  end

  it "should work as intended" do
    @ringb << "first"   # => ["first"]
    @ringb << "second"  # => ["first", "second"]
    @ringb << "third"   # => ["first", "second", "third"]
    @ringb << "fourth"  # => ["second", "third", "fourth"]

    expect(@ringb).to eq(["second", "third", "fourth"])
  end

end