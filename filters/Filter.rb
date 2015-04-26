require './lib/helper.rb'
require './lib/exception.rb'
require './lib/RingBuffer.rb'
require './lib/Resettable.rb'

# A Filter just stores input values, just to demonstrate the outline of generic Filter, acting like a placeholder.
# Allows other types of filters to inherit the data structure (list or ringbuffer) set from here.
# Filter#output will give out its input history array
class Filter
  # The input history 
  attr_reader :data

  # constructor.
  # +n+ - (optional) the size of input buffer, if desired. n can be empty to have the filter to store infinite amount.
  def initialize(n=nil)
    # check if n-value is a positive integer to make sure
    check_n_value(n)

    if n
      @data = RingBuffer.new(n)
    else
      @data = []
    end

    @n = n
  end

  # Adds input data to history of input data.
  # The assignment does not require `Filter` to have such functionality,
  # but this lets other Filters to reduce repetitive code.
  # +input_data+ - the input data to feed into the filter.
  def input(input_data)
    check_filter_input(input_data)
    @data << input_data
  end
end