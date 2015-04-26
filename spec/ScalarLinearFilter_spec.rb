# Testing for ScalarLinearFilter.rb

require './filters/ScalarLinearFilter.rb'

describe ScalarLinearFilter do
  before(:each) do
    a_arr = [0.5, 0.5]
    b_arr = [0.1]
    @filter = ScalarLinearFilter.new(a_arr, b_arr)
  end

  describe "output" do
    # good data
    it "is good data, no n-value" do
      expect( @filter.output(-1) ).to eq(-0.5)
      expect( @filter.output(1) ).to eq(0.05)
      expect( @filter.output(2) ).to eq(1.495)
      @filter.reset
      expect( @filter.output(-1) ).to eq(-0.5)
      expect( @filter.output(3) ).to eq(1.05)
      expect( @filter.output(1) ).to eq(1.895)
      expect( @filter.output(2) ).to eq(1.3105)
      expect( @filter.output(1) ).to eq(1.36895)
    end

    # bad data/boundary
    it "is bad data" do
      expect{ @filter.output(nil) }.to raise_error
      expect{ @filter.output("hi im string") }.to raise_error
    end
  end
end