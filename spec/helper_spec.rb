# Test for helper methods

require './lib/helper.rb'

describe "helper" do
  describe "check_filter_input" do
    it "good data, no exception expected" do
      expect( check_filter_input(1.0) ).to eq(true)
      expect( check_filter_input(5) ).to eq(true)
      expect( check_filter_input([1,2,3]) ).to eq(true)
    end

    it "bad data, exception excpected" do
      expect{ check_filter_input("hi im string") }.to raise_error(FilterException::InvalidTypeError)
      expect{ check_filter_input(nil) }.to raise_error(FilterException::InvalidTypeError)
    end

  end

  describe "check_scalar" do
    it "good data" do
      expect( check_scalar(1.0) ).to eq(true)
      expect( check_scalar(0) ).to eq(true)
      expect( check_scalar(-1.5) ).to eq(true)
      expect( check_scalar(Float::INFINITY) ).to eq(true)

    end
    it "bad data, exception expected" do
      expect{ check_scalar("hi im string") }.to raise_error(FilterException::InvalidTypeError)
      expect{ check_scalar(nil) }.to raise_error(FilterException::InvalidTypeError)

    end
  end
end