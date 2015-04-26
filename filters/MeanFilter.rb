# A MeanFilter outputs the mean of the input so far.
# if n-value is given, 

require './filters/Filter.rb'
require './lib/Resettable.rb'

class MeanFilter < Filter
  include Resettable
  attr_reader :n, :data, :current_mean

  def initialize(n=nil)
    super(n)
    @sum = 0.0
    @index = 0.0
  end

  # evaluates the new mean and returns it.
  # +input_data+ - the data to feed in
  def output(input_data)
    input(input_data)

    # if n is not given, it is feasible to use a more cost-efficient way to calculate the mean
    if @n
      return mean(@data)
    else
      @sum += input_data
      @index += 1
      return @sum / @index
    end
  end

  # MeanFilter supports reset!
  def reset
    @data = Resettable.reset(@data, @n)
    @sum = 0.0
    @index = 0.0
  end

  private 
  # calculates the mean of the array
  # +arr+ - the array to calculate the sum of
  def mean(arr)
    arr.inject(:+).to_f / arr.length
  end
end