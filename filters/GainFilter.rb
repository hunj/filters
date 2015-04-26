# GainFilter is a special type of FIR Filter
# where b_parameters are zero except for b_0.
# b_0 is gain.

require './filters/FIRFilter.rb'

class GainFilter < FIRFilter
  include Resettable

  # override
  def initialize(input_gain, n=nil)
    super([input_gain], n)
  end

end