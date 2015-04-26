require './filters/Filter.rb'

# Identity Filter always produces as output the same value it has read as input.
class IdentityFilter < Filter
  attr_reader :data

  # override
  def initialize
  	@data = []
  end

  # returns the last input
  def output(input_data)
    check_scalar(input_data)
    input(input_data)
    return @data[-1]
  end
end