# Exceptions Library.
module FilterException
  # General exception
  class Error < StandardError; end

  # Raised when input type is unexpected, usually used for typechecking
  class InvalidTypeError < Error; end

  # Raised when input type is correct but value is wrong
  # e.g. negative integer parameters for `binomial` method
  class InvalidArgumentError < Error; end

  # Raised when incomparable types are compared
  class IncomparableTypeError < Error; end

  # Raised when FilterCascade doesn't contain any filter
  class EmptyFilterCascadeError < Error; end

end