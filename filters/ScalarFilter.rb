# A ScalarFilter is a type of Filter whose input is scalar.

require './filters/Filter.rb'

class ScalarFilter < Filter
  # in case we want to see the input history
  attr_reader :data

  # override
  # adds input_data to input history
  def input(input_data)
    # checks if input data is a scalar type (Float or Fixnum)
    check_scalar(input_data)
    @data << input_data
  end
end