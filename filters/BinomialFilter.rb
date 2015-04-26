# BinomialFilter is a special type of FIR Filter
# where b_parameters is:
# b_i = N-choose-i. The input will be N-value of N-choose-i, which is aliased as k

require './filters/FIRFilter.rb'

class BinomialFilter < FIRFilter
  # testing purposes
  attr_reader :factorials, :binomials

  # override
  # +k+ - the 
  def initialize(k)
    set_factorial_array(k)
    @b_arr = set_binomial_array(k)
    super(@b_arr)
  end

  # sets an array of input length containing factorials up to that number using memoization
  # +length+ - the length of factorials sequence
  def set_factorial_array(length)
    @factorials = []
    @factorials[0] = 1
    @factorials[1] = 1
    for i in 2..length
      @factorials[i] = @factorials[i-1] * i
    end
    return @factorials
  end

  # returns the k-Choose-i number
  # +k+ - the k-value in kCi
  # +i+ - the i-value in kCi
  def binomial(k, i)
    return @factorials[k] / (@factorials[i] * @factorials[k-i])
  end

  # sets the binomial coefficient array
  # +k+ - the length of binomial coefficient sequence
  # i.e. the array will be: [kC0, kC1, kC2, ..., kCk]
  def set_binomial_array(k)
    @binomials = []
    for i in 0..k
      @binomials[i] = binomial(k, i)
    end
    return @binomials
  end
end