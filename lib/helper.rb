require './lib/exception.rb'

# Helper methods for filters.

# Typecheck barricade: checks the type of the input.
# If invalid type, raises InvalidTypeError.
# Note: a valid input is either Fixnum, Float, or Array.
def check_filter_input(input)
  unless input.is_a?(Fixnum) || input.is_a?(Float) || input.is_a?(Array)
    raise FilterException::InvalidTypeError.new("Input is #{input.class}, while it has to be either Fixnum, Float, or Array.")
  end
  return true
end

# Typecheck barricade: checks the type of the input.
# If input is not scalar, raises InvalidTypeError.
def check_scalar(input)
  unless input.is_a?(Fixnum) || input.is_a?(Float)
    raise FilterException::InvalidTypeError.new("Input is #{input.class}, while it has to be either Fixnum or Float (Scalar value)")
  end
  return true
end

# Typecheck Barricade: checks the n-value input in a Filter.
# If input is not a positive integer, raises InvaludArgumentError.
def check_n_value(n)
  if n.nil? or (n.is_a?(Fixnum) and n > 0)
    return true
  else
    raise FilterException::InvalidArgumentError.new("n-value must be a positive integer")
  end
end