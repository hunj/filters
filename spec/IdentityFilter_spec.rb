# Testing for IdentityFilter.rb

require './filters/IdentityFilter.rb'

describe IdentityFilter do
  before(:each) do
    @filter = IdentityFilter.new
  end

  describe "output" do
    # good data
    it "is good data" do
      expect( @filter.output(1.3) ).to eq(1.3)
      expect( @filter.output(3) ).to eq(3)
      expect( @filter.output(-2) ).to eq(-2)
      expect( @filter.output(0) ).to eq(0)
      expect( @filter.output(Float::INFINITY) ).to eq(Float::INFINITY)
    end

    # bad data/boundary
    it "is bad data" do
      expect{ @filter.output(nil) }.to raise_error
      expect{ @filter.output("hi im string") }.to raise_error
    end
  end
end