# Resettable module allows filters to support reset function.

module Resettable
  # returns a new instance of input data's type.
  # +data+ - the data array to be reseteed
  # +n+ - the n-value, if data array is a ringbuffer
  # +reset_value+ - the reset value
  def self.reset(data, n=nil, reset_value=nil)
    if n
      return data.class.new(n)
    else
      return data.class.new
    end
  end
end