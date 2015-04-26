# Testing for MeanFilter.rb

require './filters/MeanFilter.rb'

describe MeanFilter do
  before(:each) do
    @filter = MeanFilter.new
    @nfilter = MeanFilter.new(3)
  end

  describe "output" do
    # good data
    it "is good data, no n-value" do
      expect( @filter.output(1) ).to eq(1)
      expect( @filter.output(2) ).to eq(1.5)
      expect( @filter.output(-3) ).to eq(0)
      expect( @filter.output(-10) ).to eq(-2.5)
      expect( @filter.output(Float::INFINITY) ).to eq(Float::INFINITY)
      expect( @filter.output(0) ).to eq(Float::INFINITY)
    end

    it "is good data, n-value given" do
      expect( @nfilter.output(1) ).to eq(1)
      expect( @nfilter.output(3) ).to eq(2)
      expect( @nfilter.output(-2) ).to eq((1+3-2.0)/3)
      expect( @nfilter.output(0) ).to eq((3-2.0+0)/3)
      expect( @nfilter.output(Float::INFINITY) ).to eq(Float::INFINITY)
      expect( @nfilter.output(0) ).to eq(Float::INFINITY)
    end

    # bad data/boundary
    it "is bad data" do
      expect{ @filter.output(nil) }.to raise_error
      expect{ @filter.output("hi im string") }.to raise_error
    end
  end
end