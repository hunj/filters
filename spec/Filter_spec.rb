# Testing for Filter.rb

require './filters/Filter.rb'

describe Filter do
  before(:each) do
    @filter = Filter.new
    @nfilter = Filter.new(3)
  end

  describe "input" do
    it "is good data, no N-value" do
      expect(@filter.input(1)).to eq([1])
      expect(@filter.input(0)).to eq([1, 0])
      expect(@filter.input(-1)).to eq([1, 0, -1])
    end

    it "is bad data, no N-value. Should throw exceptions" do
      expect{@filter.input("")}.to raise_error(FilterException::InvalidTypeError)
      expect{@filter.input({:key => :value})}.to raise_error(FilterException::InvalidTypeError)

      # nil input follows the same thing
      expect{@filter.input(nil)}.to raise_error(FilterException::InvalidTypeError)
    end

    it "is good data, N-value given" do
      expect(@nfilter.input(1)).to eq([1])
      expect(@nfilter.input(2)).to eq([1, 2])
      expect(@nfilter.input(5)).to eq([1, 2, 5])
      expect(@nfilter.input(6)).to eq([2, 5, 6])
    end

  end

  describe "initialize" do
    # good value already shown in line 12 (@nfilter)
    # bad values:
    it "gets bad N-value given" do
      expect{ @badfilter = Filter.new(0) }.to raise_error
      expect{ @badfilter = Filter.new(-5) }.to raise_error
      expect{ @badfilter = Filter.new(Float::INFINITY) }.to raise_error
    end
  end
end