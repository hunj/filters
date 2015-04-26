# MaxFilter inherits from ComparableFilter. 
# If n-value is given, MaxFilter will return the max of the last n values.
# If not, MaxFilter will return the max input value since the beginning or since the last reset, whichever occurred last.

require './filters/ComparableFilter.rb'

class MaxFilter < ComparableFilter
  include Resettable

  # If n-value is given, iterates through all elements.
  # If n-value is not given, compares with the current max value.
  def output(input_data)
    super(input_data)

    if @n
      @max = @data.max
    elsif input_data > @max
      @max = input_data
    end
    return @max
  end

  # MaxFilter supports reset!
  def reset
    @data = Resettable.reset(@data, @n)
    @max = -Float::INFINITY
  end

end