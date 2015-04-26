# Testing for MinFilter.rb

require './filters/MinFilter.rb'

describe MinFilter do
  before(:each) do
    @filter = MinFilter.new
    @nfilter = MinFilter.new(3)
  end
  
  describe "output" do
    # Structured basis
    # good data
    it "is good data, no n-value" do
      expect( @filter.output(1) ).to eq(1)
      expect( @filter.output(-2.0) ).to eq(-2)
      expect( @filter.output(Float::INFINITY) ).to eq(-2)
      expect( @filter.output(-Float::INFINITY) ).to eq(-Float::INFINITY)
    end

    # Structured basis
    # good data
    it "is good data, n-value given, boundary" do
      expect( @nfilter.output(1) ).to eq(1)
      expect( @nfilter.output(-2.0) ).to eq(-2)
      expect( @nfilter.output(-Float::INFINITY) ).to eq(-Float::INFINITY)
      expect( @nfilter.output(0) ).to eq(-Float::INFINITY)
      expect( @nfilter.output(0) ).to eq(-Float::INFINITY)
      expect( @nfilter.output(-5) ).to eq(-5)
    end

    # Structured basis
    # bad data
    it "is bad data" do
      expect{ @filter.output(nil) }.to raise_error
      expect{ @filter.output("hi im string") }.to raise_error
    end
  end

  describe "reset" do
    # Structured basis
    it "with n, should reset properly" do
      expect( @nfilter.output(-1) ).to eq(-1)
      expect( @nfilter.output(3) ).to eq(-1)
      expect( @nfilter.output(2) ).to eq(-1)
      expect( @nfilter.output(5) ).to eq(2)
      @filter.reset
      expect( @filter.data ).to eq([])
    end

    # Structured basis
    it "without n, should reset properly" do
      expect( @filter.output(1) ).to eq(1)
      expect( @filter.output(-Float::INFINITY) ).to eq(-Float::INFINITY)
      expect( @filter.output(-10) ).to eq(-Float::INFINITY)
      expect( @filter.output(10) ).to eq(-Float::INFINITY)
      @filter.reset
      expect( @filter.data ).to eq([])
    end
  end

  #stress test
  describe "output" do
    it "should try to run out of memory" do
      number = 9999999

      for i in 0..number # largest fixnum value
        @filter.output(rand(number))
      end
    end
  end
end