# ComparableFilter is a filter

require './filters/Filter.rb'
require './lib/Resettable.rb'

class ComparableFilter < Filter
  include Resettable
  attr_reader :data, :n

  def initialize(n=nil)
    super(n)
    @min = Float::INFINITY
    @max = -Float::INFINITY
  end

  # override. stores the input data into the array.
  def output(input_data)
    input(input_data)
  end

  # ComparableFilters supports reset.
  def reset
    @data = Resettable.reset(@data, @n)
  end

end