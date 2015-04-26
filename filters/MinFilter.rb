# MinFilter inherits from ComparableFilter. 
# If n-value is given, MinFilter will return the min of the last n values.
# If not, MinFilter will return the min input value since the beginning or since the last reset, whichever occurred last.

require './filters/ComparableFilter.rb'

class MinFilter < ComparableFilter
  include Resettable

  # If n-value is given, iterates through all elements.
  # If n-value is not given, compares with the current min value.
  def output(input_data)
    super(input_data)
    
    if @n
      @min = @data.min
    elsif input_data < @min
      @min = input_data
    end
    return @min
  end

  # MinFilter supports reset!
  def reset
    @data = Resettable.reset(@data, @n)
    @min = Float::INFINITY
  end

end