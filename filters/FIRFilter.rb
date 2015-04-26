# FIRFilter is a special type of Scalar Linear Filter
# where a_parameters are all 0. (a_1..M = 0)

require './filters/ScalarLinearFilter.rb'

class FIRFilter < ScalarLinearFilter

  # override
  # +input_b_arr+ - b-parameters
  def initialize(input_b_arr)
    super([], input_b_arr)
  end
  
end