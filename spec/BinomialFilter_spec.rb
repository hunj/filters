# Testing for BinomialFilter.rb

require './filters/BinomialFilter.rb'

describe BinomialFilter do
  before(:each) do
    @filter = BinomialFilter.new(5)
  end

  describe "set_factorial_array" do
    # good data, structured basis
    it "k-value given, set the factorial array" do
      expect(@filter.factorials).to eq([1, 1, 2, 6, 24, 120])
    end
  end

  describe "set_binomial_array" do
    # good data, structured basis
    it "k-value given, set the binomial array" do
      expect(@filter.binomials).to eq([1, 5, 10, 10, 5, 1])
    end
  end

  describe "binomial(k, i)" do
    # good data, structured basis
    it "should calculate k Choose i" do
      expect(@filter.binomial(5, 0)).to eq(1)
      expect(@filter.binomial(5, 1)).to eq(5)
      expect(@filter.binomial(5, 2)).to eq(10)
      expect(@filter.binomial(5, 3)).to eq(10)
      expect(@filter.binomial(5, 4)).to eq(5)
      expect(@filter.binomial(5, 5)).to eq(1)
    end

    # stress test
    it "should calculate 9999 choose 5555" do
      big_filter = BinomialFilter.new(9999)
      big_filter.binomial(9999, 5555)
    end
  end

  

end

